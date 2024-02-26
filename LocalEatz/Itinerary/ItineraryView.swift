//
//  ItineraryView.swift
//  ItineraryView
//
//  Created by Rupaj Sen on 17/12/23.
//

import Foundation
import SwiftUI

struct ItineraryView: View {
    
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    
    var bounds: Range<Date> {
        let start = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 6))!
        let end = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 16))!
        return start ..< end
    }

    @State private var textInput: String = ""
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        NavigationStack{
            VStack{
//                ZStack {
//                    
//                    
//                    Text("Itinerary Planner")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }
//                .frame(maxWidth: .infinity, alignment: .center)
                
                ScrollView{
                    
                    Text("Place of Visit")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Enter Location", text: $textInput)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Duration of Visit")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    MultiDatePicker("Dates Available", selection: .constant([]))
                        .environment(\.locale, Locale(identifier: "en_IN"))
                        .environment(\.timeZone, TimeZone(abbreviation: "IST")!)
                        .frame(height: 400)
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    Text("Food Preference")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack{
                        Text("VEG")
                            .font(.system(size: 15, weight: .thin, design: .rounded))
                            .padding(6)
                            .background(Color("softBackground"))
                            .cornerRadius(5)
                        
                        Text("NON-VEG")
                            .font(.system(size: 15, weight: .thin, design: .rounded))
                            .padding(6)
                            .background(Color("softBackground"))
                            .cornerRadius(5)
                        
                        Text("TRADITIONAL")
                            .font(.system(size: 15, weight: .thin, design: .rounded))
                            .padding(6)
                            .background(Color("softBackground"))
                            .cornerRadius(5)
                        
                        Text("Spicy")
                            .font(.system(size: 15, weight: .thin, design: .rounded))
                            .padding(6)
                            .background(Color("softBackground"))
                            .cornerRadius(5)
                    }
                    .padding(.bottom)
                    
                    
                    
                    
                    NavigationLink {
                        ItineraryView2().navigationBarBackButtonHidden(false)
                    } label: {
                        Text("Get Itinerary")
                            .font(.system(size: 24, weight: .regular, design: .rounded))
                            .padding(15)
                            .padding(.horizontal,90)
                            .foregroundColor(.white)
                            .background(Color("coreOrange")
                                .cornerRadius(25))
                            .padding(.bottom)
                        
                    }
                    
                    /*HStack{
                     NavigationLink("Get Itinerary", destination: ItineraryView2())
                     .font(.system(size: 24, weight: .regular, design: .rounded))
                     .padding()
                     .foregroundColor(.white)
                     }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                     .background(
                     Color("orange")
                     .cornerRadius(20))
                     .padding([.horizontal],15)
                     .padding([.bottom],10)
                     .padding([.top],5)*/
                    
                    Spacer()
                }
                
            }
            .background(Color("backgroundColor"))
            
        }
        .navigationTitle("Itinerary Planner")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    ItineraryView()
}
