//
//  localfoodPlaces.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 11/01/24.
//

import SwiftUI

struct localfoodPlaces: View {
    var body: some View {
        NavigationStack
        {
            ScrollView(.vertical)
            {
                Text("Local Popular Food Places")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.bottom,20)
                
            }
            .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.top,-80)
            .background(Color("backgroundColor"))
            //.navigationTitle("Upcoming Trips")
        }
    }
}

#Preview {
    localfoodPlaces()
}
