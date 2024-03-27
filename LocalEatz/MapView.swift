//
//  MapView.swift
//  MapView
//
//  Created by Rupaj Sen on 16/12/23.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    
    let a = CLLocationCoordinate2D(latitude: 28.650554, longitude: 77.231893)
    
    let b = CLLocationCoordinate2D(latitude: 28.635308, longitude: 77.22496)
    
    let c = CLLocationCoordinate2D(latitude: 28.628646, longitude: 77.226826)
    
    var body: some View {
        
        NavigationView{
            VStack {
                ZStack {
                    /* HStack {
                     Image(systemName: "line.3.horizontal")
                     .resizable()
                     .padding()
                     .frame(width: 50, height: 50)
                     
                     Spacer()
                     }*/
                    
                    Text("Foodie Map")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Map(){
                    
                    Marker("Rupaj", systemImage: "person.circle", coordinate: a)
                        .tint(.blue)
                    
                    Marker("Tanya", systemImage: "person.circle", coordinate: b)
                        .tint(.blue)
                    
                    Marker("Dewashish", systemImage: "person.circle", coordinate: c)
                        .tint(.blue)
                }
            }
        }
    }
}

#Preview {
    MapView()
}
