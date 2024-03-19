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
            Text("Dish Detail")
                .font(.title)
                .padding()
            
            Text("\(dishName)")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.top,15)
            
            Text("Restaurants offering this dish:")
                .font(.headline)
                .padding()
            
            // Filter restaurants that offer the selected dish
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(viewModel.restaurants.filter { $0.mustHaves.contains { $0.dishName == dishName } }) { restaurant in
                        VStack(alignment: .leading) {
                            if let imageURL = restaurant.cardImageURL {
                                AsyncImage(url: imageURL)
                                    .frame(width: 200, height: 100, alignment: .center)
                                    .padding(.bottom, 8)
                            }
                            
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                Text(restaurant.restaurantName)
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                    .padding(.leading, 3)
                                    .padding(.bottom, 3)
                            }
                            
                            HStack {
                                ForEach(0..<Int(restaurant.restaurantRating), id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .foregroundColor(.orange)
                                        .symbolRenderingMode(.multicolor)
                                        .frame(width:15,height:15)
                                        .padding(.top,-2)
                                }
                                if restaurant.restaurantRating - Double(Int(restaurant.restaurantRating)) >= 0.5 {
                                    Image(systemName: "star.leadinghalf.fill")
                                        .resizable()
                                        .foregroundColor(.orange)
                                        .symbolRenderingMode(.multicolor)
                                        .frame(width:15,height:15)
                                        .padding(.top,-2)
                                }
                                Text("\(restaurant.restaurantRating, specifier: "%.1f")")
                                    .font(.system(size: 14, weight: .thin))
                                    .foregroundColor(.black)
                            }
                            
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
                            .padding(.leading,3)
                            .padding(.bottom,3)
                        }
                        .padding(.leading,10)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                viewModel.fetch()
            }
        }
        .background(Color("backgroundColor"))
    }
}

#if DEBUG
struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(dishName: "Your Dish Name")
    }
}
#endif

