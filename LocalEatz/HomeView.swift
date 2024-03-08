//
//  ContentView.swift
//  HomePage
//
//  Created by user1 on 19/12/23.
//
import SwiftUI
import MapKit


struct HomeView: View {
    var name : String //to accept restaurant name from showData
    @EnvironmentObject var viewModel1 : AuthViewModel
    
    @StateObject var viewModel = ViewModel()
    @State private var isAddingItinerary = false
    @State private var searchText = ""
    @State private var showVegOnly = false
    @State private var showNonVegOnly = false
    @State private var sortByRating = false
    
    //for user current location
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationView
        {
            
            VStack
            {
                HStack()
                {
                    Text("Chennai,Tamil Nadu")
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                        .foregroundColor(.orange)
                        .padding(.leading,40)
                        .padding(.trailing)
                    
                    if(viewModel1.userSession != nil)
                    {
                        NavigationLink(destination:
                                        ProfileView().navigationBarBackButtonHidden(false)) {
                            Text(viewModel1.currentUser?.initials ?? "")
                                .font(.title)
                                .fontWeight(.semibold)
                                //.font(.system(size: 12))
                                .foregroundStyle(Color.white)
                                .frame(width: 48, height: 48)
                                .background(Color.gray)
                            .clipShape(Circle())
                        }
                        //ProfileView()
                    }
                    else
                    {
                        NavigationLink(destination:
                                        LoginView().navigationBarBackButtonHidden(false)) {
                            Image(systemName: "person.crop.circle")
                                .resizable()                            .frame(width:36,height:36)
                               .foregroundColor(.black)
                        }
                    }
                   
                }
                .frame(maxWidth: .infinity,alignment:.trailing)
                .padding(.trailing,30)
                
                .padding(.bottom)
                ScrollView{
                    HStack{
                        Image("pointer")
                            .resizable()
                            .frame(width: 120,height: 120)
                            .padding()
                        VStack{
                            Text("Welcome")
                                .font(.system(size:30, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Text("to")
                                .font(.system(size:30, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Text("Chennai")
                                .font(.system(size:35, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            Link("Know more", destination: URL(string: "https://en.wikipedia.org/wiki/Chennai")!)
                                .font(.system(size:15, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                        }.padding([.trailing],10)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .background(Color("coreOrange"))
                    .cornerRadius(10)
                    .padding([.horizontal],15)
                    .padding([.bottom],10)
                    VStack
                    {
                        
                        HStack{
                            
                            /*
                             To get user current location
                            //location testing
                            let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
                            Text("\(coordinate.latitude), \(coordinate.longitude)")
                            //location testing ends
                            */
                            
                            Text("Upcoming Trips")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .padding()
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            
                            NavigationLink {
                                ItineraryListView()
                            } label: {
                                Text("View All")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 15))
                                    //.padding(.leading,-70)
                            }
                            
                            /*Text("View All")
                                .foregroundColor(.orange)
                                .font(.system(size: 15))*/
                        }.frame(maxWidth: .infinity,alignment: .leading)
                            .padding([.horizontal],15)
                            .padding(.bottom,-10)
                        
                        
                                              
                        ScrollView(.horizontal,showsIndicators: false)
                        {
                            HStack
                            {
                                ForEach(upcomingTripsCard) { item in
                                    HStack {
                                        
                                        VStack
                                        {
                                            Text(item.placeName)
                                                .font(.title)
                                                .font(.system(size: 22))
                                                .fontWeight(.bold)
                                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            
                                            Text(item.placeDate)
                                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                                .fontWeight(.bold)
                                            
                                        }
                                        .padding(20)
                                        
                                        Image(item.placeImage)
                                            .resizable()
                                            .frame(width:160,height: 150)
                                        
                                    }
                                    .background(Color.white)
                                    .cornerRadius(15)
                                                                    
                                }
                            
                                
                            }
                            
                        }.padding(.bottom,20).padding(.horizontal,20)
                        
                        Divider()
                        
                        HStack{
                            Text("Popular Food Places")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .padding()
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            /*Text("View All")
                                .foregroundColor(.orange)
                                .font(.system(size: 15))*/
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding([.horizontal],15)
                        
                        ScrollView(.horizontal, showsIndicators: false) 
                        {
                            HStack(spacing: 20) { // Adjust the spacing between items as needed
                                ForEach(viewModel.restaurants) { restaurant in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            
                                       
                                                if let imageURL = restaurant.cardImageURL {
                                                    AsyncImage(url: imageURL)
                                                        .frame(width: 200, height: 100,alignment: .center)
                                                    //.aspectRatio(contentMode: .fit)
                                                       // .cornerRadius(8)
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
                                        //.padding()
                                        .padding(.leading,10)
                                    }
                                    .frame(maxWidth: 200,maxHeight : 200)
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
                    

                    
                    
                    Divider()
                    VStack
                    {
                        HStack{
                            Text("Local Delicacies")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .padding()
                                .font(.system(size: 20, weight: .semibold, design: .rounded))

                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding([.horizontal],15)
                        
                        ScrollView(.horizontal, showsIndicators: false)
                        {
                            HStack(spacing: 20) { // Adjust the spacing between items as needed
                                ForEach(viewModel.restaurants) { restaurant in
                                    ForEach(restaurant.mustHaves, id: \.self)
                                    { dish in
                                        
                                        VStack(alignment: .leading) {
                                            if let imageURL = dish.mustHaveImageURL {
                                                AsyncImage(url: imageURL)
                                                    .frame(width: 200, height: 100,alignment: .center)
                                                    .padding(.bottom, 8)
                                            }
                                            VStack{
                                                Text(dish.dishName)
                                                    .font(.system(size: 18, weight: .medium))
                                                    .foregroundColor(.black)
                                                    .padding(.leading, 3)
                                                    .padding(.bottom, 3)
                                                    .frame(maxWidth:.infinity,alignment:.leading)
                                                
                                                
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
                                        .frame(maxWidth: 200,maxHeight : 200)
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
                                  
                    /*
                        ScrollView(.horizontal,showsIndicators: false)
                        {
                            HStack
                            {
                                ForEach(localDelicaciesCard){ item in
                                    VStack
                                    {
                                        Image(item.foodImage)
                                            .resizable()
                                            .frame(width:200,height: 100)
                                        Text(item.foodName)
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                            .padding(.bottom,-3)
                                            .padding(.leading,5)
                                        
                                        Text(item.foodRestaurant)
                                            .font(.system(size: 18, weight: .light, design: .rounded))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                            .padding(.bottom,-3)
                                            .padding(.leading,5)
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.trailing,20)
                                }
                            
                            }
                        }
                        .padding(.bottom,20).padding(.horizontal,20)*/
                        
                    }
                }
            }
                .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color("backgroundColor"))
            
            
            
            }
        .onAppear{
            CLLocationManager().requestWhenInUseAuthorization()
        }
        
    }
}

#Preview {
    HomeView(name: "")
}
