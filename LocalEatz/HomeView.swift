
//
//  ContentView.swift
//  HomePage
//
//  Created by user1 on 19/12/23.
//



import SwiftUI
import MapKit

struct HeaderView: View {
    @EnvironmentObject var viewModel1: AuthViewModel
    
    var body: some View {
        HStack {
            Text("Chennai, Tamil Nadu")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .foregroundColor(.orange)
                .padding(.leading, 40)
                .padding(.trailing)
            
            if viewModel1.userSession != nil {
                NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(false)) {
                    Text(viewModel1.currentUser?.initials ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(width: 48, height: 48)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
            } else {
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(false)) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 30)
        .padding(.bottom)
    }
}

struct IntroductionView: View {
    var body: some View {
        HStack {
            Image("pointer")
                .resizable()
                .frame(width: 120, height: 120)
                .padding()
            VStack(alignment: .leading) {
                Text("Welcome")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                Text("to")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                Text("Potheri")
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                
                Link("Know more", destination: URL(string: "https://en.wikipedia.org/wiki/Chennai")!)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
            }
            .padding([.trailing], 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("coreOrange"))
        .cornerRadius(10)
        .padding([.horizontal], 15)
        .padding([.bottom], 10)
    }
}

struct UpcomingTripsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Upcoming Trips")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                NavigationLink(destination: ItineraryListView()) {
                    Text("View All")
                        .foregroundColor(.orange)
                        .font(.system(size: 15))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal], 15)
            .padding(.bottom, -10)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(upcomingTripsCard) { item in
                        HStack {
                            VStack {
                                Text(item.placeName)
                                    .font(.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(item.placeDate)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.bold)
                                
                            }
                            .padding(20)
                            
                            Image(item.placeImage)
                                .resizable()
                                .frame(width:140,height: 140)
                            
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        
                    }
                }
            }.padding(.horizontal,20)
            
        }
    }
}

struct PopularFoodPlacesView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular Food Places")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal], 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(viewModel.restaurants) { restaurant in
                        HStack {
                            VStack(alignment: .leading) {
                                if let imageURL = restaurant.cardImageURL {
                                    AsyncImage(url: imageURL)
                                        .frame(width: 200)
                                        .padding(.bottom, 8)
                                }
                                
                                NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                    Text(restaurant.restaurantName)
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.black)
                                        .padding(.leading, 3)
                                        .padding(.bottom, 3)
                                        .frame(width:200,alignment: .leading)
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
                        }
                        .frame(maxWidth: 200,maxHeight : 250)
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
    }
}

struct LocalDelicaciesView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Local Delicacies")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal], 15)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack(spacing: 20) { // Adjust the spacing between items as needed
                    ForEach(viewModel.restaurants) { restaurant in
                        ForEach(restaurant.mustHaves, id: \.self)
                        { dish in
                            
                            VStack(alignment: .leading) 
                            {
                                if let imageURL = dish.mustHaveImageURL {
                                    AsyncImage(url: imageURL)
                                        .frame(width: 200)
                                        .padding(.bottom, 8)
                                }
                                VStack
                                {
                                    NavigationLink(destination: DishDetailView(dishName: dish.dishName)) {
                                        Text(dish.dishName)
                                            .font(.system(size: 18, weight: .medium))
                                            .foregroundColor(.black)
                                            .padding(.leading, 3)
                                            .padding(.bottom, 3)
                                            .frame(maxWidth:.infinity,alignment:.leading)
                                    }
                                    
                                    HStack {
                                        ForEach(0..<Int(dish.dishRating), id: \.self) { _ in
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .foregroundColor(.orange)
                                                .symbolRenderingMode(.multicolor)
                                                .frame(width:15,height:15)
                                                .padding(.top,-2)
                                        }
                                        if dish.dishRating - Double(Int(dish.dishRating)) >= 0.5 {
                                            Image(systemName: "star.leadinghalf.fill")
                                                .resizable()
                                                .foregroundColor(.orange)
                                                .symbolRenderingMode(.multicolor)
                                                .frame(width:15,height:15)
                                                .padding(.top,-2)
                                        }
                                        Text("\(dish.dishRating, specifier: "%.1f")")
                                            .font(.system(size: 14, weight: .thin))
                                            .foregroundColor(.black)
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                }
                                .padding(.leading,10)
                                .padding(.bottom,10)
                            }
                            .frame(maxWidth: 200,maxHeight : 230)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct HomeView: View {
    var name: String // to accept restaurant name from showData
    @EnvironmentObject var viewModel1: AuthViewModel
    
    @StateObject var viewModel = ViewModel()
    @State private var isAddingItinerary = false
    @State private var searchText = ""
    @State private var showVegOnly = false
    @State private var showNonVegOnly = false
    @State private var sortByRating = false

    // for user current location
    @ObservedObject private var locationManager = LocationManager()

    var body: some View {
        NavigationView {
            VStack {

                HeaderView(viewModel1: _viewModel1)
                ScrollView {
                    IntroductionView()
                    UpcomingTripsView()
                    LocalDelicaciesView(viewModel: viewModel)
                    PopularFoodPlacesView(viewModel: viewModel)
                }
            }
            .background(Color("backgroundColor"))
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: "")
    }
}

