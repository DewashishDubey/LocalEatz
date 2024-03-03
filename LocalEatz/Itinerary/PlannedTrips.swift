//
//  PlannedTrips.swift
//  LocalEatz
//
//  Created by user1 on 10/01/24.
//

import Foundation
import SwiftUI

struct PlannedTrips: View {
    //showing itinerary
    @State private var itineraries: [Itinerary] = []
    @State private var isLoading = false
    @State private var selectedItinerary: Itinerary? = nil
    @State private var isAddingItinerary = false
    var body: some View {
        
        VStack {
            
            
                Text("Itinerary Planner")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
            
            ScrollView{
            
                VStack{
                    
                    
                    Text("Itinerary")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                   
                    
                        NavigationLink{
                            AddItineraryView()
                        }label: {
                            HStack
                            {
                                Image(systemName: "plus")
                                    .foregroundColor(.orange)
                                Text("Plan a new Itienary")
                                    .foregroundColor(.orange)
                            }
                        }
 

                    HStack{
                        Text("Upcoming Trips")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        .padding([.horizontal],15)
                        .padding(.top)
                    
                    ItineraryListView()
                    
                    
                    
                    /*HStack{
                        Text("Previous Trips")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        .padding([.horizontal],15)
                        .padding(.top)
                    
                    HStack {
                        VStack
                        {
                            Text("LUCKNOW")
                                .font(.title)
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            Text("18 NOW - 19 NOV")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .fontWeight(.bold)
                            
                            
                            Text("Know more")
                                .underline()
                                .font(.system(size:15, weight: .semibold, design: .rounded))
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        }
                        .padding(10)

                        Image("lucknow")
                            .resizable()
                            .frame(width:180,height: 150)
                        
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()*/
                    
                    
                    
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("backgroundColor"))
    }

}

#Preview {
    PlannedTrips()
}
