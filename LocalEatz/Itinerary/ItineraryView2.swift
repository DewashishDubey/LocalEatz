//
//  ContentView.swift
//  itineraryPage
//
//  Created by Dewashish Dubey on 21/12/23.
//

import SwiftUI

struct ItineraryView2: View {
    var body: some View {
        NavigationStack{
            VStack
            {
//                HStack(spacing:40)
//                {
//                    /* Image(systemName: "line.3.horizontal")
//                     .resizable()
//                     .frame(width:20,height:20)*/
//                    Text("Chandigarh,Punjab")
//                        .font(.system(size: 22, weight: .semibold, design: .rounded))
//                        .foregroundColor(.orange)
//                        .padding(.leading,40)
//                        .padding(.trailing)
//                    Image("profileImage")
//                        .resizable()
//                        .frame(width:64,height:64)
//                }
//                .padding(.bottom,30)
                
                ScrollView{
                    
                    HStack
                    {
                        HStack
                        {
                            Divider()
                                .frame(width:4,height:600)
                                .overlay(.orange)
                        }
                        VStack
                        {
                            Text("Day 1")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .padding(.bottom)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            ScrollView(.horizontal,showsIndicators: false)
                            {
                                HStack
                                {
                                    VStack
                                    {
                                        Image("dhaba")
                                            .resizable()
                                            .frame(width:200,height: 100)
                                        Text("Gulshan Dhaba")
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                            .padding(.bottom,-3)
                                            .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "star.fill")
                                                .symbolRenderingMode(.multicolor)
                                            Text("4.5")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                            Text("(25+)")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.bottom,3)
                                        .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "clock")
                                                .symbolRenderingMode(.multicolor)
                                            Text("10-15 mins")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        HStack{
                                            Text("FISH FRY")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                            
                                            Text("FAST FOOD")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        .padding(.bottom,15)
                                        
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.trailing,20)
                                    
                                    
                                    VStack
                                    {
                                        Image("dhaba")
                                            .resizable()
                                            .frame(width:200,height: 100)
                                        Text("Gulshan Dhaba")
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                            .padding(.bottom,-3)
                                            .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "star.fill")
                                                .symbolRenderingMode(.multicolor)
                                            Text("4.5")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                            Text("(25+)")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.bottom,3)
                                        .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "clock")
                                                .symbolRenderingMode(.multicolor)
                                            Text("10-15 mins")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        HStack{
                                            Text("FISH FRY")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                            
                                            Text("FAST FOOD")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        .padding(.bottom,15)
                                        
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                
                            }.padding(.bottom,20)
                            
                            Text("Day 2")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .padding(.bottom)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            ScrollView(.horizontal,showsIndicators: false)
                            {
                                HStack
                                {
                                    VStack
                                    {
                                        Image("dhaba")
                                            .resizable()
                                            .frame(width:200,height: 100)
                                        Text("Gulshan Dhaba")
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                            .padding(.bottom,-3)
                                            .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "star.fill")
                                                .symbolRenderingMode(.multicolor)
                                            Text("4.5")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                            Text("(25+)")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.bottom,3)
                                        .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "clock")
                                                .symbolRenderingMode(.multicolor)
                                            Text("10-15 mins")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        HStack{
                                            Text("FISH FRY")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                            
                                            Text("FAST FOOD")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        .padding(.bottom,15)
                                        
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.trailing,20)
                                    
                                    
                                    VStack
                                    {
                                        Image("dhaba")
                                            .resizable()
                                            .frame(width:200,height: 100)
                                        Text("Gulshan Dhaba")
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                            .padding(.bottom,-3)
                                            .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "star.fill")
                                                .symbolRenderingMode(.multicolor)
                                            Text("4.5")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                            Text("(25+)")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.bottom,3)
                                        .padding(.leading,5)
                                        HStack
                                        {
                                            Image(systemName: "clock")
                                                .symbolRenderingMode(.multicolor)
                                            Text("10-15 mins")
                                                .font(.system(size: 14, weight: .thin, design: .rounded))
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        HStack{
                                            Text("FISH FRY")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                            
                                            Text("FAST FOOD")
                                                .font(.system(size: 12, weight: .thin, design: .rounded))
                                                .padding(6)
                                                .background(Color("softBackground"))
                                                .cornerRadius(5)
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                        .padding(.leading,5)
                                        .padding(.bottom,15)
                                        
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                
                            }
                            
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                        .padding(.leading,10)
                        
                        
                        
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading,40)
                    
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("backgroundColor"))
          
        }
        .navigationTitle("Itinerary")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ItineraryView2()
}
