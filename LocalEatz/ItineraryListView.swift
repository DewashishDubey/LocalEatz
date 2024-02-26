//
//  ItineraryListView.swift
//  API_Calls
//
//  Created by Dewashish Dubey on 22/02/24.
//


import SwiftUI
import CoreLocation

struct ItineraryListView: View {
    @State private var itineraries: [Itinerary] = []
    @State private var isLoading = false
    @State private var selectedItinerary: Itinerary? = nil
    @State private var isAddingItinerary = false

    var body: some View {
        
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    List(itineraries, id: \.self) { itinerary in
                        NavigationLink(
                            destination: ItineraryDetailView(itinerary: itinerary),
                            tag: itinerary,
                            selection: $selectedItinerary
                        ) {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text("\(itinerary.location)").font(.title)
                                        .font(.system(size: 10))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    Text("\(itinerary.startDate) - \(itinerary.endDate)").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    
                                     
                                   /* Text("\(itinerary.preference)").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)*/
                                        
                                }
                                
                                
                                Image("mumbai")
                                    .resizable()
                                    .frame(width:100,height: 100)
                                
                                
                                
                            }.background(Color.white)
                                .cornerRadius(15)
                                 
                            
                        }
                    }
                    
                }
            }
            .onAppear {
                fetchItineraries()
            }
            .padding(.top,-20)
        }
    }
    
    func fetchItineraries() {
        guard let url = URL(string: "http://localhost:3002/itinerary") else {
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ItineraryList.self, from: data)
                    DispatchQueue.main.async {
                        self.itineraries = decodedData.itineraries
                        isLoading = false
                    }
                } catch {
                    print("Error decoding itinerary data: \(error)")
                    isLoading = false
                }
            }
        }.resume()
    }
}

struct ItineraryListView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryListView()
    }
}

struct ItineraryDetailView: View {
    var itinerary: Itinerary
    @StateObject var restaurantViewModel = RestaurantViewModel()
    
    var body: some View {
        ScrollView
        {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Location: \(itinerary.location)")
                    Text("Start Date: \(itinerary.startDate)")
                    Text("End Date: \(itinerary.endDate)")
                    Text("Preference: \(itinerary.preference)")
                    Text("Number of Days: \(numberOfDaysBetweenDates())")
                }
                .padding()
                
                if !restaurantViewModel.restaurants.isEmpty {
                                   // Text("Restaurants")
                                     //   .font(.title)
                                    
                                    // Run loop for the number of days
                                    ForEach(1...numberOfDaysBetweenDates(), id: \.self) { dayNumber in
                                        if let matchingRestaurants = matchingRestaurants(forDay: dayNumber) {
                                            VStack(alignment: .leading) {
                                                Text("Day \(dayNumber)")
                                                    .font(.headline)
                                                    .padding(.top)
                                                
                                                ForEach(matchingRestaurants.prefix(3), id: \.id) { restaurant in
                                                    RestaurantView(restaurant: restaurant)
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .padding()
                                        .onAppear {
                                            restaurantViewModel.fetchRestaurants()
                                        }
                                }
            }
        }
    }
    
    func numberOfDaysBetweenDates() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        guard let startDate = dateFormatter.date(from: itinerary.startDate),
              let endDate = dateFormatter.date(from: itinerary.endDate) else {
            return 0
        }
        
        let numberOfDays = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
        return numberOfDays
    }
    
    func matchingRestaurants(forDay dayNumber: Int) -> [Restaurant]? {
           let matchingRestaurants = restaurantViewModel.restaurantsWithinRange(from: itinerary.coordinates, for: DateInfo(date: "", dayNumber: dayNumber))
               .filter { $0.preference.lowercased() == itinerary.preference.lowercased() }
               .sorted { $0.restaurantRating > $1.restaurantRating }
           
           return matchingRestaurants.isEmpty ? nil : matchingRestaurants
       }
}

// RestaurantViewModel to handle networking and data parsing
class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    
    func fetchRestaurants() {
        guard let url = URL(string: "http://localhost:3000/restaurants") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = restaurants
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func restaurantsWithinRange(from sourceCoordinates: [Double], for date: DateInfo) -> [Restaurant] {
        let sourceLocation = CLLocation(latitude: sourceCoordinates[0], longitude: sourceCoordinates[1])
        return restaurants.filter { restaurant in
            let destinationLocation = CLLocation(latitude: restaurant.coordinates[0], longitude: restaurant.coordinates[1])
            let distance = sourceLocation.distance(from: destinationLocation) / 1000 // Convert to kilometers
            return distance <= 2
        }
    }
}

struct RestaurantView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(restaurant.restaurantName)
                .font(.title)
            Text("Rating: \(restaurant.restaurantRating)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(restaurant.restaurantDesc)
                .font(.body)
            Text("Tags: \(restaurant.restaurantTags.joined(separator: ", "))")
                .font(.caption)
                .foregroundColor(.blue)
            
            // You can add more information here if needed
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}

// Model structs

struct ItineraryList: Codable {
    let itineraries: [Itinerary]
}

struct DateInfo: Codable, Hashable {
    let date: String
    let dayNumber: Int
}


