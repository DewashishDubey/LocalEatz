//
//  ContentView.swift
//  MapView
//
//  Created by Dewashish Dubey on 16/12/23.
//

import SwiftUI
import PhotosUI
import MapKit
struct ContentView: View {
    
    @State private var selectedTab = "One"
    var body: some View {
            
        TabView(selection: $selectedTab){
                
            
            NavigationView {
                            VStack
                            {
                                HomeView(name: "")
                            }
                            
                        }
                        .padding(.top,-30)
                        .tabItem {
                            Label("Discover", systemImage: "safari")
                        }
                        .tag("One")
            NavigationView {
                VStack
                {
                    RestaurantRecommendation()
                }
                
            }
            .tabItem {
                Label("Near Me", systemImage: "fork.knife")
            }
            .tag("two")
            
            NavigationView {
                VStack
                {
                    PlannedTrips()
                }
                
            }
            .tabItem {
                Label("Itinerary", systemImage: "map")
            }
            .tag("three")
            
            
            }
    }
}





#Preview {
    ContentView()
}
