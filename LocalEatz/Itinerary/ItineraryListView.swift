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
                            Text("Itinerary")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                           
                            
                                NavigationLink{
                                    AddItineraryView()
                                }label: {
                                    HStack
                                    {
                                        Image(systemName: "plus")
                                            .foregroundColor(.orange)
                                        Text("Plan a new Itienary")
                                            .foregroundColor(.orange)
                                    }
                                }

            .sheet(isPresented: $isAddingItinerary) {
                AddItineraryView()
            }

                HStack{
                    Text("Upcoming Trips")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding([.horizontal],15)
                    .padding(.top)
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
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .background(Color("backgroundColor"))
            //.padding(.top,-20)
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
    @State private var selectedSegment = 0
    var body: some View {
        ScrollView
        {
            VStack(alignment: .leading, spacing: 20) {
                /*VStack(alignment: .leading) {
                    Text("Location: \(itinerary.location)")
                    Text("Start Date: \(itinerary.startDate)")
                    Text("End Date: \(itinerary.endDate)")
                    Text("Preference: \(itinerary.preference)")
                    Text("Number of Days: \(numberOfDaysBetweenDates())")
                }
                .padding()*/
                
                
                if !restaurantViewModel.restaurants.isEmpty {
                                   // Text("Restaurants")
                                     //   .font(.title)
                                    
                                    // Run loop for the number of days
                    
                    ScrollView {
                                VStack(alignment: .leading, spacing: 20) {
                                    // SegmentedPicker for Breakfast, Lunch, Dinner
                                    Picker(selection: $selectedSegment, label: Text("Select Meal")) {
                                        Text("Breakfast").tag(0)
                                        Text("Lunch").tag(1)
                                        Text("Dinner").tag(2)
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    .padding(.horizontal)

                                    // Show restaurants based on selected meal
                                    switch selectedSegment {
                                    case 0: // Breakfast
                                        showRestaurants(for: "Breakfast")
                                    case 1: // Lunch
                                        showRestaurants(for: "Lunch")
                                    case 2: // Dinner
                                        showRestaurants(for: "Dinner")
                                    default:
                                        Text("No restaurants found")
                                    }
                                }
                                .padding()
                            }
                            .onAppear {
                                restaurantViewModel.fetchRestaurants()
                            }
                            .background(Color("backgroundColor").ignoresSafeArea())
                    
                                    /*ForEach(1...numberOfDaysBetweenDates(), id: \.self) { dayNumber in
                                        if let matchingRestaurants = matchingRestaurants(forDay: dayNumber) {
                                            VStack(alignment: .leading) {
                                                Text("Day \(dayNumber)")
                                                    .font(.headline)
                                                    .padding(.top)
                                                    .frame(maxWidth:.infinity,alignment:.leading)
                                                    .padding(.leading,20)
                                                ScrollView(.horizontal)
                                                {
                                                    HStack{
                                                        ForEach(matchingRestaurants.prefix(3), id: \.id) { restaurant in
                                                            RestaurantView(restaurant: restaurant)
                                                        }
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }*/
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
        .background(Color("backgroundColor").ignoresSafeArea())
    }
    
    // Function to display restaurants for the selected meal
    @ViewBuilder func showRestaurants(for meal: String) -> some View {
        let filteredRestaurants = restaurantViewModel.restaurants.filter { $0.meal.lowercased() == meal.lowercased() }

        if filteredRestaurants.isEmpty {
            Text("No restaurants found for \(meal)")
                .foregroundColor(.red)
                .padding()
        } else {
            ForEach(1...numberOfDaysBetweenDates(), id: \.self) { dayNumber in
                Text("Day \(dayNumber)")
                    .font(.headline)
                    .padding(.top)
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .padding(.leading,20)
                ScrollView(.vertical) {
                    LazyVStack(spacing: 20) {
                        ForEach(filteredRestaurants) { restaurant in
                            RestaurantView(restaurant: restaurant)
                        }
                    }
                    .padding(.horizontal)
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

private func calculateDistance(_ coordinate1: CLLocationCoordinate2D, _ coordinate2: CLLocationCoordinate2D) -> Double {
        let earthRadius: Double = 6371 // Radius of the Earth in kilometers

        let lat1 = coordinate1.latitude.degreesToRadians
        let lon1 = coordinate1.longitude.degreesToRadians
        let lat2 = coordinate2.latitude.degreesToRadians
        let lon2 = coordinate2.longitude.degreesToRadians

        let dlon = lon2 - lon1
        let dlat = lat2 - lat1

        let a = sin(dlat / 2) * sin(dlat / 2) + cos(lat1) * cos(lat2) * sin(dlon / 2) * sin(dlon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))

        return earthRadius * c
    }

struct RestaurantView: View {
    var restaurant: Restaurant
    @ObservedObject private var locationManager = LocationManager()

    
    var body: some View {
        VStack(alignment: .leading) {
            // Display the image
            if let imageURL = restaurant.cardImageURL {
                AsyncImage(url: imageURL)
                    .frame(width: 360)
            }
            
            // Display text content below the image
            VStack(alignment: .leading, spacing: 8) {
                HStack{
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        Text(restaurant.restaurantName)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    if let userLocation = locationManager.location {
                        let distance = calculateDistance(userLocation.coordinate, restaurant.coordinate2D())
                        HStack{
                            Image(systemName: "location")
                            Text("\(String(format: "%.1f", distance)) km")
                                .font(.system(size: 12, weight: .light, design: .rounded))
                                .foregroundColor(.black)
                        }
                        .offset(x:35)
                    }
                }
                
                HStack {
                    ForEach(0..<Int(restaurant.restaurantRating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                    if restaurant.restaurantRating - Double(Int(restaurant.restaurantRating)) >= 0.5 {
                        Image(systemName: "star.leadinghalf.fill")
                            .foregroundColor(.orange)
                    }
                    Text(String(format: "%.1f", restaurant.restaurantRating))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 5) {
                    Text(restaurant.meal)
                        .font(.caption)
                        .padding(6)
                        .background(Color("softBackground"))
                        .cornerRadius(5)
                    
                    Text(restaurant.preference)
                        .font(.caption)
                        .padding(6)
                        .background(Color("softBackground"))
                        .cornerRadius(5)
                }
                .foregroundColor(.black)
            }
            .padding()
            .padding(.top,-10)
        }
        .padding(.bottom,10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
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

//test push
