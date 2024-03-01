//
//  viewReview.swift
//  API_Calls
//
//  Created by Dewashish Dubey on 23/02/24.
//

import SwiftUI

struct viewReview: View {
    let restaurant: Restaurant
    var body: some View {
        ScrollView{
            VStack
            {
                ForEach(restaurant.restaurantReviews, id: \.self) { review in
                    VStack{
                        
                        HStack{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack{
                                Text(review.userName ?? "")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text(review.reviewDate)
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
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
                        .padding(.top,3)
                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
//                        HStack{
//                            Image(systemName: "star.fill")
//                                .symbolRenderingMode(.multicolor)
//                            Text("\(review.userRating,specifier: "%0.1f")")
//                                .font(.system(size: 14, weight: .thin, design: .rounded))
//                        }
//                        .padding(.top,3)
//                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        HStack{
                            Text(review.userReview)
                                .padding(.top,3)
                                
                        }.frame(maxWidth: .infinity,alignment:.leading)
                    }//.padding(.bottom,30)
                    Divider()
                }
            }
            .padding(.top,100)
            .padding()
            
        }
        .ignoresSafeArea()
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("backgroundColor"))
    }
}

struct viewReview_Previews: PreviewProvider {
    static var previews: some View {
        viewReview(restaurant: Restaurant(id: "1", restaurantName: "Sample Restaurant", restaurantRating: 4.5, restaurantDesc: "Sample Description", restaurantTags: ["Tag1", "Tag2"], restaurantReviews: [], cardImageURL: nil, mustHaves: [], meal: "Lunch", preference: "NonVeg", coordinates: [0, 0]))
    }
}

