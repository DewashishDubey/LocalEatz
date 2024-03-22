import SwiftUI

struct DishDetailView: View {
    let dishName: String
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(dishName)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            Text("Restaurants offering this dish:")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.restaurants.filter { $0.mustHaves.contains { $0.dishName == dishName } }) { restaurant in
                        VStack(alignment: .leading, spacing: 10) {
                            if let imageURL = restaurant.cardImageURL {
                                AsyncImage(url: imageURL)
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                            
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                Text(restaurant.restaurantName)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                            }
                            
                            HStack(spacing: 5) {
                                ForEach(0..<Int(restaurant.restaurantRating)) { _ in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.orange)
                                }
                                if restaurant.restaurantRating - Double(Int(restaurant.restaurantRating)) >= 0.5 {
                                    Image(systemName: "star.leadinghalf.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.orange)
                                }
                                Text(String(format: "%.1f", restaurant.restaurantRating))
                                    .font(.footnote)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text(restaurant.meal)
                                    .font(.caption)
                                    .fontWeight(.thin)
                                    .padding(6)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                                
                                Text(restaurant.preference)
                                    .font(.caption)
                                    .fontWeight(.thin)
                                    .padding(6)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .background(Color("backgroundColor").ignoresSafeArea())
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(dishName: "Your Dish Name")
    }
}
