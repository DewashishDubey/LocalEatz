//
//  RestaurantRecommendation.swift
//  LocalEatz
//
//  Created by user1 on 10/01/24.
//

import SwiftUI
import MapKit
import Foundation

extension Array where Element == Double {
    var asNSArray: NSArray {
        return NSArray(array: self)
    }
}

struct Restaurant: Hashable, Codable, Identifiable {
    var id: String
    var restaurantName: String
    var restaurantRating: Double
    var restaurantDesc: String
    var restaurantTags: [String]
    var restaurantReviews: [RestaurantReview]
    var cardImageURL: URL? // URL for the restaurant image
    var mustHaves: [MustHaveDish]
    var meal: String // Meal type (e.g., Lunch, Dinner)
    var preference: String // Preference (e.g., NonVeg, Veg)
    var coordinates: [Double] // Coordinates [latitude, longitude]

    enum CodingKeys: String, CodingKey {
        case id
        case restaurantName
        case restaurantRating
        case restaurantDesc
        case restaurantTags
        case restaurantReviews
        case cardImageURL = "CardImage"
        case mustHaves = "MustHaves"
        case meal
        case preference
        case coordinates
    }

    func formatCoordinates() -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 6
        let formattedLat = formatter.string(from: NSNumber(value: coordinates[0])) ?? ""
        let formattedLong = formatter.string(from: NSNumber(value: coordinates[1])) ?? ""
        return "\(formattedLat), \(formattedLong)"
    }

    func coordinate2D() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
}

struct RestaurantReview: Hashable, Codable {
    var userName: String
    var reviewDate: String
    var userRating: Double
    var userReview: String
}

struct MustHaveDish: Hashable, Codable {
    var dishName: String
    var dishRating: Double
    var mustHaveImageURL: URL? // URL for the must-have dish image

    enum CodingKeys: String, CodingKey {
        case dishName
        case dishRating
        case mustHaveImageURL = "MustHaveImage"
    }
}

class ViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []

    func fetch() {
        guard let url = URL(string: "http://localhost:3000/restaurants") else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                DispatchQueue.main.async {
                    self?.restaurants = restaurants
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}

struct RestaurantRecommendation: View {
    enum Segment {
        case restaurants
        case dishes
    }

    @StateObject var viewModel = ViewModel()
    @State private var isAddingItinerary = false
    @State private var searchText = ""
    @State private var showVegOnly = false
    @State private var showNonVegOnly = false
    @State private var sortByRating = false
    @State private var selectedSegment: Segment = .restaurants

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Picker("Segment", selection: $selectedSegment) {
                    Text("Restaurants").tag(Segment.restaurants)
                    Text("Dishes").tag(Segment.dishes)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if selectedSegment == .restaurants {
                    RestaurantListView(viewModel: viewModel, searchText: $searchText, showVegOnly: $showVegOnly, showNonVegOnly: $showNonVegOnly, sortByRating: $sortByRating)
                } else {
                    DishListView(viewModel: viewModel, searchText: $searchText)
                }
            }
            .background(Color("backgroundColor"))
        }
    }
}

struct RestaurantListView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var searchText: String
    @Binding var showVegOnly: Bool
    @Binding var showNonVegOnly: Bool
    @Binding var sortByRating: Bool

    var body: some View {
        VStack {
            // Search Bar
            SearchBar(text: $searchText, placeholder: "Search Restaurants")
                .padding(.bottom, 10)

            FilterView(showVegOnly: $showVegOnly, showNonVegOnly: $showNonVegOnly, sortByRating: $sortByRating)

            // List of Restaurants
            ScrollView {
                ForEach(filteredRestaurants) { restaurant in
                    RestaurantCardView(restaurant: restaurant)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            }
        }
        .background(Color("backgroundColor"))
        .onAppear {
            viewModel.fetch()
        }
    }

    private var filteredRestaurants: [Restaurant] {
        var filteredRestaurants = viewModel.restaurants

        if !searchText.isEmpty {
            filteredRestaurants = filteredRestaurants.filter { $0.restaurantName.localizedCaseInsensitiveContains(searchText) }
        }

        if showVegOnly {
            filteredRestaurants = filteredRestaurants.filter { $0.preference == "Veg" }
        } else if showNonVegOnly {
            filteredRestaurants = filteredRestaurants.filter { $0.preference == "NonVeg" }
        }

        if sortByRating {
            filteredRestaurants = filteredRestaurants.sorted(by: { $0.restaurantRating > $1.restaurantRating })
        }

        return filteredRestaurants
    }
}

struct DishListView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var searchText: String

    var body: some View {
        VStack {
            // Search Bar for dishes
            SearchBar(text: $searchText, placeholder: "Search Dishes")
                .padding(.bottom, 10)

            ScrollView {
                ForEach(viewModel.restaurants) { restaurant in
                    ForEach(restaurant.mustHaves.filter {
                        searchText.isEmpty || $0.dishName.localizedCaseInsensitiveContains(searchText)
                    }, id: \.self) { dish in
                        DishCardView(dish: dish)
                    }
                }
            }
        }
        .background(Color("backgroundColor"))
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct FilterView: View {
    @Binding var showVegOnly: Bool
    @Binding var showNonVegOnly: Bool
    @Binding var sortByRating: Bool

    var body: some View {
        HStack(spacing: 10) {
            TagButton(title: "Veg", isSelected: $showVegOnly, color: .green) {
                showVegOnly.toggle()
                showNonVegOnly = false // Deselect Non-Veg tag
            }
            TagButton(title: "Non-Veg", isSelected: $showNonVegOnly, color: .red) {
                showNonVegOnly.toggle()
                showVegOnly = false // Deselect Veg tag
            }
            TagButton(title: "Rating", isSelected: $sortByRating, color: .blue) {
                sortByRating.toggle()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .padding(.bottom, 5)
    }
}
struct TagButton: View {
    var title: String
    @Binding var isSelected: Bool
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(isSelected ? color : .black)
                Text(title)
                    .font(.system(size: 15, weight: .thin, design: .rounded))
                    .padding(.horizontal, 6)
                    .foregroundColor(.black)
            }
            .font(.system(size: 15, weight: .thin, design: .rounded))
            .padding(6)
            .background(isSelected ? color.opacity(0.2) : Color.white)
            .cornerRadius(5)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(15)
                .frame(minWidth: 0, maxWidth: .infinity) // Fixed width
                .padding(.leading) // Add leading padding to center the TextField
            Image(systemName: "magnifyingglass")
                .padding(.trailing, 20)
                .foregroundColor(.gray)
        }
        .padding(.top, 10)
    }
}

struct AsyncImage: View {
    @StateObject private var imageLoader: ImageLoader
    private let placeholder: Image

    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            placeholder
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
        loadImage()
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

struct RestaurantCardView: View {
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
}

struct DishCardView: View {
    let dish: MustHaveDish

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let imageURL = dish.mustHaveImageURL {
                AsyncImage(url: imageURL)
                    .frame(width: 360, height: 200)
                    .cornerRadius(15)
            }

            NavigationLink(destination: DishDetailView(dishName: dish.dishName)) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(dish.dishName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    HStack(spacing: 5) {
                        ForEach(0..<Int(dish.dishRating)) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.orange)
                        }
                        Text("\(dish.dishRating, specifier: "%.1f")")
                            .font(.callout)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

extension Double {
    var degreesToRadians: Double { return self * .pi / 180 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRecommendation()
    }
}
//test
