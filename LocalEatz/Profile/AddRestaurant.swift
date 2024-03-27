//
//  AddRestaurant.swift
//  MapView
//
//  Created by Rupaj Sen on 28/12/23.
//

import Foundation
import SwiftUI

struct AddRestaurant: View {
    
    @State private var textInput: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
//                ZStack {
//                    /*HStack {
//                     Image(systemName: "line.3.horizontal")
//                     .resizable()
//                     .padding()
//                     .frame(width: 50, height: 50)
//                     
//                     Spacer()
//                     }*/
//                    
//                    Text("Add Restaurant")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }
//                .frame(maxWidth: .infinity, alignment: .center)
                
                ScrollView{
                    
                    Text("Add a Location")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Text("Name")
                        .font(.title3)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    TextField("Name of the Restaurant", text: $textInput)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Text("Location")
                            .font(.title3)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.top)
                        
                        Image(systemName: "mappin.and.ellipse")
                            .padding(.top)
                        Text("Choose on Map")
                            .underline()
                            .font(.system(size: 14))
                            .padding(.top)
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Choose the Location", text: $textInput)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    Text("Tags that suits best")
                        .font(.title3)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    VStack {
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
                            
                            Text("FAST FOOD")
                                .font(.system(size: 15, weight: .thin, design: .rounded))
                                .padding(6)
                                .background(Color("softBackground"))
                                .cornerRadius(5)
                        }
                        HStack{
                            Text("SEA-FOOD")
                                .font(.system(size: 15, weight: .thin, design: .rounded))
                                .padding(6)
                                .background(Color("softBackground"))
                                .cornerRadius(5)
                            
                            Text("SPICY")
                                .font(.system(size: 15, weight: .thin, design: .rounded))
                                .padding(6)
                                .background(Color("softBackground"))
                                .cornerRadius(5)
                            
                            Text("LOCAL")
                                .font(.system(size: 15, weight: .thin, design: .rounded))
                                .padding(6)
                                .background(Color("softBackground"))
                                .cornerRadius(5)
                            
                            Text("+")
                                .font(.system(size: 15, weight: .thin, design: .rounded))
                                .padding(6)
                                .background(Color("softBackground"))
                                .cornerRadius(5)
                        }
                    }
                    
                    Text("Menu")
                        .font(.title3)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    TextField("Add Menu", text: $textInput)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    Text("Must Haves")
                        .font(.title3)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    TextField("Add Must Haves", text: $textInput)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    Text("Dining Area")
                        .font(.title3)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    TextField("Add Must Haves", text: $textInput)
                        .padding(.leading)
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    HStack{
                        Text("Submit")
                            .font(.system(size: 24, weight: .regular, design: .rounded))
                            .padding()
                            .foregroundColor(.white)
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                        .background(
                            Color("coreOrange")
                                .cornerRadius(20))
                        .padding([.horizontal],15)
                        .padding([.bottom],10)
                        .padding([.top],5)
                    
                }
            }
            .background(Color("backgroundColor"))
        }
        .navigationTitle("Add Restaurant")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    AddRestaurant()
}
