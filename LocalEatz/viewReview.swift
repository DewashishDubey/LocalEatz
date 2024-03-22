import SwiftUI

struct viewReview: View {
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(restaurant.restaurantReviews, id: \.self) { review in
                    VStack {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack {
                                Text(review.userName)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(review.reviewDate)
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        HStack {
                            ForEach(0..<Int(review.userRating), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .symbolRenderingMode(.multicolor)
                                    .frame(width: 15, height: 15)
                                    .padding(.top, -2)
                            }
                            if review.userRating - Double(Int(review.userRating)) >= 0.5 {
                                Image(systemName: "star.leadinghalf.fill")
                                    .resizable()
                                    .foregroundColor(.orange)
                                    .symbolRenderingMode(.multicolor)
                                    .frame(width: 15, height: 15)
                                    .padding(.top, -2)
                            }
                            Text("\(review.userRating, specifier: "%.1f")")
                                .font(.system(size: 14, weight: .thin))
                                .foregroundColor(.black)
                        }
                        .padding(.top, 3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text(review.userReview)
                                .padding(.top, 3)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
            }
            .padding(.top, 100)
            .padding()
        }
        .background(Color("backgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct viewReview_Previews: PreviewProvider {
    static var previews: some View {
        viewReview(restaurant: Restaurant(id: "1", restaurantName: "Sample Restaurant", restaurantRating: 4.5, restaurantDesc: "Sample Description", restaurantTags: ["Tag1", "Tag2"], restaurantReviews: [], cardImageURL: nil, mustHaves: [], meal: "Lunch", preference: "NonVeg", coordinates: [0, 0]))
    }
}
