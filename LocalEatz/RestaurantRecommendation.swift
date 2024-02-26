//
//  RestaurantRecommendation.swift
//  LocalEatz
//
//  Created by user1 on 10/01/24.
//

/*
import Foundation
import SwiftUI

struct RestaurantRecommendation: View {
    @State private var searchItem = ""
    
    var body: some View {
        NavigationStack
        {
            VStack
            {
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack
                    {
                        HStack {
                            HStack {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                Text("Filters")
                            }
                                    .font(.system(size: 15, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(5)

                            
                            HStack {
                                Image(systemName: "dot.square")
                                    .foregroundColor(.green)
                                Text("Veg")
                            }
                                    .font(.system(size: 15, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(5)
                            
                            HStack {
                                Image(systemName: "dot.square")
                                    .foregroundColor(.red)
                                Text("Non-Veg")
                            }
                                    .font(.system(size: 15, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(5)
                            
                            HStack {
                                Image(systemName: "map")
                                    .foregroundColor(.blue)
                                Text("Nearest")
                            }
                                    .font(.system(size: 15, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(5)
                            
                            HStack {
                                Image(systemName: "star")
                                    .foregroundColor(.orange)
                                Text("Rating")
                            }
                                    .font(.system(size: 15, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(5)
                            
                        }
                    }
                    .padding(.leading)
                }
                
                
                ScrollView{
                    VStack
                    {
                        HStack{
                            Text("Restaurants Recommended")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
            
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding()
                        
                        
                        ScrollView(.vertical,showsIndicators: false)
                        {
                            //VStack
                            //{
                            ForEach(Restaurantcards){ item in
                                VStack
                                {
                                    
                                    VStack {
                                        Image(item.image)
                                            .resizable()
                                        .frame(width:360,height: 200)
                                    }
                                    .frame(maxWidth:.infinity,alignment:.leading)
                                        //.padding()
                                    NavigationLink(item.restaurantName, destination: AboutView())
                                        .font(.system(size: 24, weight: .medium, design: .rounded))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.bottom,-3)
                                        .padding(.leading,5)
                                    HStack
                                    {
                                        Image(systemName: "star.fill")
                                            .symbolRenderingMode(.multicolor)
                                        Text(item.rating)
                                            .font(.system(size: 14, weight: .thin, design: .rounded))
                                        Text(item.numberOfRatings)
                                            .font(.system(size: 14, weight: .thin, design: .rounded))
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .padding(.bottom,3)
                                    .padding(.leading,5)
                                    HStack
                                    {
                                        Image(systemName: "clock")
                                            .symbolRenderingMode(.multicolor)
                                        Text(item.timimg)
                                            .font(.system(size: 14, weight: .thin, design: .rounded))
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .padding(.leading,5)
                                    HStack{
                                        Text(item.famousFood[0])
                                            .font(.system(size: 12, weight: .thin, design: .rounded))
                                            .padding(6)
                                            .background(Color("softBackground"))
                                            .cornerRadius(5)
                                        
                                        Text(item.famousFood[1])
                                            .font(.system(size: 12, weight: .thin, design: .rounded))
                                            .padding(6)
                                            .background(Color("softBackground"))
                                            .cornerRadius(5)
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .padding(.leading,5)
                                    .padding(.bottom,15)
                                    
                                }
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.bottom,20)
                            }
                        }.padding(.bottom,20).padding(.horizontal,20)
                    }
            }
        }
            .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("backgroundColor"))
        }
        .searchable(text: $searchItem, prompt: "Find for food or restaurant...")
    }
}

#Preview {
    RestaurantRecommendation()
}*/

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

// Works with marker
struct RestaurantRecommendation: View {
    @StateObject var viewModel = ViewModel()
    @State private var isAddingItinerary = false
    @State private var searchText = ""
    @State private var showVegOnly = false
    @State private var showNonVegOnly = false
    @State private var sortByRating = false

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $searchText)
                    .padding(.bottom, 5)
 
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
                
                // List of Restaurants
                ScrollView {
                    ForEach(filteredRestaurants) { restaurant in
                        // Restaurant Card View
                        VStack(alignment: .leading) {
                            if let imageURL = restaurant.cardImageURL {
                                AsyncImage(url: imageURL)
                                    .frame(width:360,height: 200)

                            }
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                Text(restaurant.restaurantName)
                                    .font(.system(size: 24, weight: .medium, design: .rounded))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, -3)
                                    .padding(.leading, 5)
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                    .symbolRenderingMode(.multicolor)
                                Text("\(restaurant.restaurantRating, specifier: "%.1f")")
                                    .font(.system(size: 14, weight: .thin, design: .rounded))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 3)
                            .padding(.leading, 5)
                            
                            HStack {
                                Text("\(restaurant.meal)")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                                
                                Text("\(restaurant.preference)")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .padding(6)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 20)
                        }
                        .padding(.leading,15)
                        .background(Color.white)
                        .cornerRadius(15)
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                }
            }
            .background(Color("backgroundColor")) // Set background color to blue
//            .navigationBarItems(trailing:
//                Button(action: {
//                    isAddingItinerary = true
//                }) {
//                    Text("Add Itinerary")
//                }
//                .font(.headline)
//            )
//            .sheet(isPresented: $isAddingItinerary) {
//                AddItineraryView()
//            }
            .onAppear {
                viewModel.fetch()
            }
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

struct RestaurantRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRecommendation()
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

    var body: some View {
        HStack {
            TextField("Search Restaurants", text: $text)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal)
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
                .aspectRatio(contentMode: .fit)
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
