//
//  AddItineraryView.swift
//  API_Calls
//
//  Created by Dewashish Dubey on 22/02/24.
//

import SwiftUI
import MapKit

struct AddItineraryView: View {
    @Environment(\.presentationMode) var presentationMode //to dismiss the sheet
    @State private var userEmail = ""
    @State private var location = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var preference = ""
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .coreOrange
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
       
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Email", text: $userEmail)
                }
                
                Section(header: Text("Trip Details")) {
                    TextField("Location", text: $location)
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        .accentColor(.orange)
                        .padding(1)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                        .accentColor(.orange)
                        .padding(1)
                }
                
                Section(header: Text("Preferences")) {
//                    TextField("Preference", text: $preference)
                    // Replace TextField with Dropdown
                    Picker("Preference", selection: $preference) {
                        Text("Veg").tag("Veg")
                        Text("Non-Veg").tag("NonVeg")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.top,5)
                    .padding(.bottom,5)
                }
                
                // Map View
                Section(header: Text("Select Location")) {
                    Mapview(selectedCoordinate: $selectedCoordinate)
                        .frame(height: 200)
                        .cornerRadius(8)
                }
                
                Section {
                    Button("Submit") {
                        if let selectedCoordinate = selectedCoordinate {
                            addItinerary(selectedCoordinate: selectedCoordinate)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            print("No coordinate selected")
                        }
                    }.font(.system(size: 24, weight: .regular, design: .rounded))
                        .padding(15)
                        .padding(.horizontal,90)
                        .foregroundColor(.white)
                        .background(Color("coreOrange")
                            .cornerRadius(25))
                        .padding(7)
                }.listRowBackground(Color.clear)
            }
            .navigationTitle("Add Itinerary")
        }
    }
    
    func addItinerary(selectedCoordinate: CLLocationCoordinate2D) {
        // Create the itinerary object
        let itinerary = Itinerary(
            userEmail: userEmail,
            location: location,
            startDate: formatDate(date: startDate),
            endDate: formatDate(date: endDate),
            preference: preference,
            coordinates: [selectedCoordinate.latitude, selectedCoordinate.longitude]
        )
        
        // Convert the itinerary object to JSON data
        guard let jsonData = try? JSONEncoder().encode(itinerary) else {
            print("Error encoding itinerary data.")
            return
        }
        
        // Prepare the request
        guard let url = URL(string: "http://localhost:3002/itinerary") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Send the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error adding itinerary: \(error)")
            } else if let data = data,
                      let response = String(data: data, encoding: .utf8) {
                print("Itinerary added successfully: \(response)")
                
                // Optionally handle success response or navigate to a different view
            }
        }.resume()
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}

struct Mapview: UIViewRepresentable {
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: Mapview
        
        init(parent: Mapview) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? MKPointAnnotation {
                parent.selectedCoordinate = annotation.coordinate
            }
        }
        
        @objc func tapGestureHandler(_ gesture: UITapGestureRecognizer) {
            let mapView = gesture.view as! MKMapView
            let tapLocation = gesture.location(in: mapView)
            let coordinate = mapView.convert(tapLocation, toCoordinateFrom: mapView)
            
            // Remove existing annotation
            if let existingAnnotation = mapView.annotations.first {
                mapView.removeAnnotation(existingAnnotation)
            }
            
            // Add new annotation
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
            parent.selectedCoordinate = coordinate
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let initialLocation = CLLocationCoordinate2D(latitude: 12.820489093437436, longitude: 80.03731817360415)
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapGestureHandler(_:)))
        mapView.addGestureRecognizer(tapGesture)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}

struct Itinerary: Codable, Hashable{
    let userEmail: String
    let location: String
    let startDate: String
    let endDate: String
    let preference: String
    let coordinates: [Double]
}

struct AddItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        AddItineraryView()
    }
}

