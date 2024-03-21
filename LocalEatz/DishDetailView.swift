//
//  DishDetailView.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 19/03/24.
//

import SwiftUI

struct DishDetailView: View {
    let dishName: String
    @StateObject var viewModel = ViewModel() // Assuming ViewModel is the view model containing the list of restaurants
    
    var body: some View {
        VStack {
            Text("\(dishName)")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Text("Restaurants offering this dish:")
                .font(.headline)
                .padding()
            
            // Filter restaurants that offer the selected dish
            ScrollView {
                ForEach(viewModel.restaurants.filter { $0.mustHaves.contains { $0.dishName == dishName } }) { restaurant in
                    VStack(alignment: .leading) {
                        if let imageURL = restaurant.cardImageURL {
                            AsyncImage(url: imageURL)
                                .frame(width: 360, height: 200)
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
                            ForEach(0..<Int(restaurant.restaurantRating), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .symbolRenderingMode(.multicolor)
                                    .frame(width: 15, height: 15)
                                    .padding(.top, -2)
                            }
                            if restaurant.restaurantRating - Double(Int(restaurant.restaurantRating)) >= 0.5 {
                                Image(systemName: "star.leadinghalf.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .symbolRenderingMode(.multicolor)
                                    .frame(width: 15, height: 15)
                                    .padding(.top, -2)
                            }
                            Text("\(restaurant.restaurantRating, specifier: "%.1f")")
                                .font(.system(size: 14, weight: .thin))
                                .foregroundColor(.black)
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
                        .padding(.leading, 5)
                    }
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.bottom, 20)
                }
            }
            .background(Color("backgroundColor"))
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

#if DEBUG
struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(dishName: "Your Dish Name")
    }
}
#endif
