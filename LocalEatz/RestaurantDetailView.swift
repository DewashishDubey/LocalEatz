//
//  RestaurantDetailView.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 25/02/24.
//
import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    @EnvironmentObject var viewModel1 : AuthViewModel
    @State var showAlert : Bool = false
    
    // State variables for managing review input
    @State private var isAddingReview = false
    @State private var reviewText = ""
    @State private var rating = 0
    

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let imageURL = restaurant.cardImageURL {
                    AsyncImage(url: imageURL)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 10)
                        .cornerRadius(15)
                }
                HStack{
                    Text(restaurant.restaurantName)
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top,15)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    if let latitude = restaurant.coordinates.first, let longitude = restaurant.coordinates.last {
                        Button(action: {
                            // Open Apple Maps with route from current location to destination
                            if let url = URL(string: "http://maps.apple.com/?saddr=Current%20Location&daddr=\(latitude),\(longitude)") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                                Image(systemName: "map.circle.fill")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .padding(.trailing,20)
                                    .padding(.top,15)
                        }
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
                .padding(.top,-10)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                

                Text(restaurant.restaurantDesc)
                    .font(.system(size: 16, weight: .thin, design: .rounded))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.top,-3)
                    .padding(.bottom,10)
                    .foregroundStyle(Color.black)
                
                
                
                Button(action: {
                    
                    if(viewModel1.userSession != nil)
                    {
                        // Show the review sheet
                        isAddingReview = true
                    }
                    else
                    {
                        LoginView()
                    }
                }) {
                    Text("Add Review")
                }
                .frame(maxWidth: .infinity)
                .font(.system(size: 20, weight: .regular, design: .rounded))
                .padding(15)
                .padding(.horizontal,90)
                .foregroundColor(.white)
                .background(Color("coreOrange")
                    .cornerRadius(25))
                .padding(.bottom)
                
                //show reviews of the restaurant
                
                HStack
                {
                    NavigationLink("Reviews", destination: viewReview(restaurant: restaurant) /*ReviewView()*/)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    Image(systemName: "chevron.forward")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(restaurant.restaurantReviews, id: \.self) { review in
                            VStack{
                                HStack {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(Color.black)
                                    Text(review.userName ?? "")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(Color.black)
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
                                .frame(maxWidth: .infinity, alignment: .leading)
//                                HStack {
//                                    Image(systemName: "star.fill")
//                                        .symbolRenderingMode(.multicolor)
//                                    Text("\(review.userRating,specifier: "%0.1f")")
//                                        .font(.system(size: 14, weight: .thin, design: .rounded))
//                                        .foregroundStyle(Color.black)
//                                }
//                                .frame(maxWidth: .infinity, alignment: .leading)
                                Text(review.userReview)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 355, height: 80, alignment: .leading)
                                    .minimumScaleFactor(0.5)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                }
                //show reviews of the restaurant ends
                
                //must haves part starts
                HStack
                {
                    Text("Must Haves")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundStyle(Color.black)
                    //Image(systemName: "chevron.forward")
                }
                .padding(.top)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack
                    {
                        ForEach(restaurant.mustHaves, id: \.self) { dish in
                            
                            VStack(alignment: .leading) {
                                if let imageURL = dish.mustHaveImageURL {
                                    AsyncImage(url: imageURL)
                                        //.resizable()
                                        .frame(width:280,height: 200)
                                        .aspectRatio(contentMode: .fit)
                                }
                                VStack{
                                    Text(dish.dishName)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.bottom,2)
                                        .foregroundStyle(Color.black)
                                    
                                    
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
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                }
                                .padding(.leading,10)
                                .padding(.bottom,10)
                            }
                            .frame(maxWidth:290,maxHeight:300)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                }
                
                //must have part ends
                
                // Map view with restaurant markers
                
                HStack
                {
                    Text("Location")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundStyle(Color.black)
                    //Image(systemName: "chevron.forward")
                }
                .padding(.top)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                Map(coordinateRegion: .constant(
                        MKCoordinateRegion(
                            center: restaurant.coordinate2D(),
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    ), annotationItems: [restaurant]) { restaurant in
                        MapPin(coordinate: restaurant.coordinate2D())
                            
                    }
                    .frame(height: 200)
                    .cornerRadius(8)
                
                
            }
            .padding()
            .padding(.top,-10)
        }
        .background(Color("backgroundColor"))
        .sheet(isPresented: $isAddingReview) {
            AddReviewView(isPresented: $isAddingReview, restaurantID: restaurant.id) {
                // This closure is called when a review is submitted
                // You can perform any actions you want here, like updating the data model or sending the review to a server
                print("Review submitted:")
                print("Text: \(reviewText)")
                print("Rating: \(rating)")
                
                // Reset review input fields
                reviewText = ""
                rating = 0
            }
        }
    }
}



struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(id: "1", restaurantName: "Milan", restaurantRating: 4.2, restaurantDesc: "Milan is a punjabi Dhaba in potheri. It is known for its classic tandoor delicacies and the must have, Biryani", restaurantTags: ["Authentic", "Biryani", "Tandoor"], restaurantReviews: [], cardImageURL: nil, mustHaves: [], meal: "Lunch", preference: "NonVeg", coordinates: [12.822747258152685, 80.04443913819455]))
    }
}

