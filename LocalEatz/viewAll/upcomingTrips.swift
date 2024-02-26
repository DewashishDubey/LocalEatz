//
//  upcomingTrips.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 11/01/24.
//

import SwiftUI

struct upcomingTrips: View {
    var body: some View {
        NavigationView
        {
            ScrollView(.vertical)
            {
//                Text("Upcoming Trips")
//                    .font(.system(size: 28, weight: .bold, design: .rounded))
//                    .frame(maxWidth: .infinity,alignment: .center)
//                    .padding(.bottom,20)
                VStack
                {
                        HStack {
                            
                            VStack
                            {
                                Text("MUMBAI")
                                    .font(.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                
                                Text("15 JAN - 19 JAN")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                   
                                
                                
                                Text("Know more")
                                    .underline()
                                    .font(.system(size:15, weight: .semibold, design: .rounded))
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            }
                            .padding(10)
                            .padding(.leading,10)
                            
                            Image("mumbai")
                                .resizable()
                                .frame(width:200,height: 150)
                            
                        }
                        .frame(maxWidth: 370,maxHeight:200)
                        .background(Color.white)
                        .cornerRadius(15)
                        
                }
            }
            
            .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
           // .padding(.top,-80)
            .background(Color("backgroundColor"))
            .navigationTitle("Upcoming Trips")
        .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }
}

#Preview {
    upcomingTrips()
}
