//
//  ContentView.swift
//  My reviews
//
//  Created by user1 on 29/12/23.
//

import SwiftUI

struct MyReviews: View {
    var body: some View {
        NavigationView{
            VStack{
//                Text("My Reviews")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .padding()
                ScrollView{
                    VStack{
                        HStack{
                            Image("dhaba")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width: 32, height: 32)
                            VStack{
                                Text("Gulshan Plaza")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("25/06/2020")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        HStack{
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                            Text("4.5")
                                .font(.system(size: 14, weight: .thin, design: .rounded))
                        }
                        .padding(.top,3)
                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        Text("Really convenient and the points system helps build loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out more remote.")
                            .padding(.top,3)
                    }.padding(.bottom,30)
                    
                    
                    
                    VStack{
                        HStack{
                            Image("barbecue")
                                .resizable()
                                .border(.black)
                                .cornerRadius(15)
                                .frame(width: 32, height: 32)
                            VStack{
                                Text("Barbecue")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("20/06/2020")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        HStack{
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                            Text("2.5")
                                .font(.system(size: 14, weight: .thin, design: .rounded))
                        }
                        .padding(.top,3)
                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        Text("Got an intro offer of 50% off first order that did not work..... I have scaled the app to find a contact us button but only a spend with us button available. ")
                            .padding(.top,3)
                    }.padding(.bottom,30)
                }
            }
            .padding()
            .background(Color("backgroundColor"))
        }
        .navigationTitle("My Reviews")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    MyReviews()
}
