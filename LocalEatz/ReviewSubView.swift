//
//  ReviewSubView.swift
//  MapView
//
//  Created by Rupaj Sen on 20/12/23.
//

import Foundation
import SwiftUI

struct ReviewSubView: View {
    @State private var text: String = ""
    @State private var text2: String = ""
    
    
    var body: some View {
        VStack {
            /*ZStack {
                        HStack {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .padding()
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                        }
                        
                        Text("Add Review")
                            .font(.title2)
                            .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)*/
            VStack{
                Image("dhaba")
                    .resizable()
                    .frame(width: 350, height: 175)
                    .scaledToFit()
                    .shadow(radius: 10)
                
                Image("dalMakhni")
                    .frame(width: 160,height: 160)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .offset(y: -80)
            }
            VStack
            {
                Text("Gulshan Dhaba")
                    .font(.system(size: 28, weight: .regular, design: .rounded))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    .padding(.top,15)
                
                Text("Amritsar, Pubjab")
                    .font(.system(size: 16, weight: .thin, design: .rounded))
                    .padding(.bottom)
                
                Text("Good")
                    .foregroundColor(.orange)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                HStack{
                    Image(systemName: "star.fill")
                        .symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill")
                        .symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill")
                        .symbolRenderingMode(.multicolor)
                    Image(systemName: "star.fill")
                        .symbolRenderingMode(.multicolor)
                    Image(systemName: "star")
                        .symbolRenderingMode(.multicolor)
                }
                
                TextField("Write a review...", text: $text)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(height: 100)
                                
                
                HStack{
                    Text("Submit")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                        .padding()
                        .foregroundColor(.white)
                }.frame(maxWidth: .infinity,alignment: .center)
                    .background(
                        Color("coreOrange")
                            .cornerRadius(20))
                    .padding([.horizontal],15)
                    .padding([.bottom],10)
                    .padding([.top],5)
                
                
            }
            .frame( maxWidth: .infinity, alignment: .leading)
            .padding(.top,-80)

            Spacer()
            
        }
        .padding(.top,40)
        .background(Color("backgroundColor"))     
    }
}

#Preview {
    ReviewSubView()
}

