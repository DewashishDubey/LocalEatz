//
//  reviews.swift
//  aboutRestaurant
//
//  Created by Dewashish Dubey on 19/12/23.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false)
            {
                VStack{
//                    Text("Reviews")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding(.bottom,30)
//                        .padding(.top,-10)
                    
                    VStack{
                        HStack{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack{
                                Text("Dewashish Dubey")
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
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack{
                                Text("Rupaj Sen")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("20/06/2020")
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
                        Text("Been a life saver for keeping our sanity during the pandemic, although they could improve some of their ui and how they handle specials as it often is unclear how to use them or everything is sold out so fast it feels a bit bait and switch. Still I'd be stir crazy and losing track of days without so...")
                            .padding(.top,3)
                    }.padding(.bottom,30)
                    
                    VStack{
                        HStack{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack{
                                Text("Tanya Sinha")
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
                    
                    VStack{
                        HStack{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack{
                                Text("Zaid")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("20/06/2020")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        HStack{
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                            Text("3.5")
                                .font(.system(size: 14, weight: .thin, design: .rounded))
                        }
                        .padding(.top,3)
                        .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis. Amet minim mollit non deserunt ullamco est sit.")
                            .padding(.top,3)
                    }.padding(.bottom,30)
                    
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .padding(.top,100)
                .padding()
                
            }
            .ignoresSafeArea()
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(Color("backgroundColor"))
        }
        .navigationTitle("Reviews")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    ReviewView()
}
