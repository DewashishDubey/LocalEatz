//
//  ContentView.swift
//  My friends
//
//  Created by user1 on 30/12/23.
//

import SwiftUI

struct MyFriends: View {
    var body: some View {
        NavigationView{
            VStack{
//                Text("My Friends")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .padding(.bottom)
                
                ScrollView{
                    VStack{
                        HStack{
                            Image("Person")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width: 70, height: 70)
                            VStack{
                                Text("Rupaj Sen")
                                    .font(.system(size:  21))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Siliguri,West Bengal")
                                    .font(.system(size: 16, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        
                        
                    }.padding()
                        .frame(maxWidth: 350,maxHeight:160,alignment:.leading)
                        .background(Color.white)
                        .cornerRadius(15)
                    
                    Spacer()
                    
                    
                    VStack{
                        HStack{
                            Image("person2")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width: 70, height: 70)
                            VStack{
                                Text("Dewashish Dubey")
                                    .font(.system(size:  21))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Muzaffarpur, Bihar")
                                    .font(.system(size: 16, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        
                    }.padding()
                        .frame(maxWidth: 350,maxHeight:160,alignment:.leading)
                        .background(Color.white)
                        .cornerRadius(15)
                    
                    Spacer()
                    VStack{
                        HStack{
                            Image("Person3")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width: 70, height: 70)
                            VStack{
                                Text("Tanya Sinha")
                                    .font(.system(size:  21))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Nagpur,Maharashtra")
                                    .font(.system(size: 16, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: 350,maxHeight:160,alignment:.leading)
                    .background(Color.white)
                    .cornerRadius(15)
                    
                    Spacer()
                }
                
            }
            .padding()
            .background(Color("backgroundColor"))
            
        }
        .navigationTitle("My Friends")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    MyFriends()
}
