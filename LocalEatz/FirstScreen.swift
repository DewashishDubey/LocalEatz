//
//  ContentView.swift
//  TestApp
//
//  Created by Dewashish Dubey on 16/12/23.
//

import SwiftUI
struct FirstScreen: View {
    var body: some View {
        NavigationView
        {
            TabView
            {
                pageView(imageName: "introductoryImage2", title: "Plan your food explorations!",showDismissButton: false)
                    .background(Color("coreOrange"))
                
                pageView(imageName: "introductoryImage3", title: "Locate Local Popular Dishes that make you droll",showDismissButton: false)
                    .background(Color("coreOrange"))
                
                pageView(imageName: "introductoryImage1", title: "See where your Friends are and what they are eating!",showDismissButton: false)
                    .background(Color("coreOrange"))
                
                pageView(imageName: "introductoryImage4", title: "Find Local Popular Food Outlets",showDismissButton: true)
                    .background(Color("coreOrange"))
            }
            .background(
                Color("coreOrange").edgesIgnoringSafeArea(.all)
                  )
            .tabViewStyle(PageTabViewStyle())
        }.padding(.top,-10)
        }
    }
struct pageView : View{
    
    let imageName : String
    let title : String
    let showDismissButton : Bool
    
    
    var body: some View{
        
        VStack
        {
            HStack(spacing:10)
            {
                Image("logo")
                VStack
                {
                    Text("LocalEatz")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Divider()
                        .frame(width:160,height:3)
                        .overlay(.white)
                        .padding(.top,-20)
                    Text("Find Local Treasures")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding(.top,-20)
                    
                }
            }
            .frame(maxWidth: .infinity,alignment: .center)
            .padding(.top,30)
            .padding(.bottom,30)
            
            Text(title)
                .font(.system(size: 32, weight: .medium, design: .rounded))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding([.leading,.trailing],15)

            Image(imageName)
                .resizable()
                .frame(width:350,height: 350)
                .padding(.bottom)
            
            
            if showDismissButton
            {
                NavigationLink {
                    ContentView().navigationBarBackButtonHidden(true)
                } label: {
                    Image(systemName: "arrow.right.circle")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width:48,height:48)
//                    Text("Get Started")
//                        .font(.system(size: 28, weight: .bold, design: .rounded))
//                        .foregroundColor(Color.black)
//                       .padding(10)
//                       .padding(.horizontal,80)
//                       .background(
//                          Color.white
//                             .cornerRadius(20))
                }
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
    }
}

#Preview {
    FirstScreen()
}
