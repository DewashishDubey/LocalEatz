//
//  ContentView.swift
//  placesVisited
//
//  Created by Dewashish Dubey on 30/12/23.
//

import SwiftUI

struct PlacesVisited: View {
    var body: some View {
        NavigationView{
            VStack
            {
//                Text("Places Visited")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .padding(.bottom)
                ScrollView{
                    HStack
                    {
                        VStack
                        {
                            Image("dhaba")
                                .resizable()
                                .frame(width: 120,height: 130)
                            
                        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.topLeading)
                        
                        VStack
                        {
                            HStack {
                                Text("Gulshan Dhaba")
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            //.padding(.leading,1)
                            HStack
                            {
                                Text("4.5")
                                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                                Image(systemName: "star.fill")
                                    .symbolRenderingMode(.multicolor)
                                    .resizable()
                                    .frame(width:10,height:10)
                                Text("(30+)")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                            
                            HStack
                            {
                                Image(systemName: "mappin.and.ellipse")
                                    .symbolRenderingMode(.multicolor)
                                    .resizable()
                                    .frame(width:12,height:18)
                                Text("Chandigarh, Punjab")
                                    .font(.system(size: 14, weight: .thin, design: .rounded))
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                            
                            HStack
                            {
                                Text("Chicken")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(4)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                                
                                Text("Fast Food")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(4)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                            
                            HStack
                            {
                                Text("2 months ago")
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                        }
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.topLeading)
                        //.padding(.leading)
                    }
                    .padding()
                    .frame(maxWidth: 350,maxHeight:160,alignment:.leading)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.bottom)
                    
                    HStack
                    {
                        VStack
                        {
                            Image("dhaba")
                                .resizable()
                                .frame(width: 120,height: 130)
                            
                        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.topLeading)
                        
                        VStack
                        {
                            HStack {
                                Text("Gulshan Dhaba")
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            //.padding(.leading,1)
                            HStack
                            {
                                Text("4.5")
                                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                                Image(systemName: "star.fill")
                                    .symbolRenderingMode(.multicolor)
                                    .resizable()
                                    .frame(width:10,height:10)
                                Text("(30+)")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                            
                            HStack
                            {
                                Image(systemName: "mappin.and.ellipse")
                                    .symbolRenderingMode(.multicolor)
                                    .resizable()
                                    .frame(width:12,height:18)
                                Text("Chandigarh, Punjab")
                                    .font(.system(size: 14, weight: .thin, design: .rounded))
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                            
                            HStack
                            {
                                Text("Chicken")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(4)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                                
                                Text("Fast Food")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(4)
                                    .background(Color("softBackground"))
                                    .cornerRadius(5)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                            
                            HStack
                            {
                                Text("2 months ago")
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .padding(.top,-1)
                        }
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.topLeading)
                        //.padding(.leading)
                    }
                    .padding()
                    .frame(maxWidth: 350,maxHeight:160,alignment:.leading)
                    .background(Color.white)
                    .cornerRadius(15)
                    
                    Spacer()
                }
            }
            .padding(.top,40)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color("backgroundColor"))
        }
        .navigationTitle("Places Visited")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    PlacesVisited()
}
