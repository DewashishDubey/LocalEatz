//
//  signup_page.swift
//  login
//
//  Created by Dewashish Dubey on 28/12/23.
//

import SwiftUI

struct signup_page: View {
    @State private var username : String = "";
    @State private var password : String = "";
    var body: some View {
        NavigationView
        {
            VStack()
            {
                VStack
                {
                    Image("logo")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 300,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack
                    {
                        Text("Sign-up")
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .regular, design: .rounded))
                        
                        VStack
                        {
                            Text("Email Address")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .topLeading)
                            TextField("", text: $username)
                            Divider()
                                .overlay(.black)
                                .padding(.bottom,40)
                            
                            Text("Password")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .topLeading)
                            TextField("", text: $password)
                            Divider()
                                .overlay(.black)
                                //.padding(.bottom,30)
                        }
                        .padding(30)
                        .font(.system(size: 16, weight: .thin, design: .rounded))
                        .padding(.bottom,30)
                        
                        
                        NavigationLink {
                            ProfileView().navigationBarBackButtonHidden(false)
                        } label: {
                            Text("Sign-up")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                                .padding(15)
                                .padding(.horizontal,80)
                                .background(
                                    Color("coreOrange")
                                        .cornerRadius(20))

                        }
                        NavigationLink("Already a member? Login", destination: login_page())
                            .foregroundColor(.orange)
                        Spacer()
                    }
                    //.navigationBarBackButtonHidden(true))
            }
        }
        
    }
}

#Preview {
    signup_page()
}
