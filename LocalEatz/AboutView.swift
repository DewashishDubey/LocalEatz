//
//  about.swift
//  aboutRestaurant
//
//  Created by Dewashish Dubey on 19/12/23.
//

import SwiftUI

struct AboutView: View {
    @State var showAlert : Bool = false
    var body: some View {
            ScrollView{
                VStack{
                    Image("dhaba")
                        .resizable()
                        .frame(width: 330, height: 200)
                        .shadow(radius: 10)
                    Text("Gulshan Dhaba")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top,15)
                    HStack{
                        Image(systemName: "star.fill")
                            .symbolRenderingMode(.multicolor)
                        Text("4.5")
                            .font(.system(size: 14, weight: .thin, design: .rounded))
                        Text("(30)")
                            .font(.system(size: 14, weight: .thin, design: .rounded))
                    }
                    .padding(.top,-10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    
                    VStack{
                        Text("Authentic")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            .padding(.bottom,-5)
                        Text("Punjabi")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.bottom,-5)
                        Text("Food")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    }
                    .padding(.top,5)

                    Text("Gulshann Dhaba is a Punjabi Dhaba in Amritsar, Punjab, India that originated as a small restaurant selling dal and roti set up by Lal Kesar Mal, a Punjabi Hindu in Sheikhpura, near Lahore in 1916")
                        .font(.system(size: 16, weight: .thin, design: .rounded))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        .padding(.top,-3)
                        .padding(.bottom,10)
                    
                    
                    
                    NavigationLink {
                        ReviewSubView().navigationBarBackButtonHidden(false)
                    } label: {
                        Button("Add Review")
                        {
                            showAlert.toggle();
                        }
                        .alert("Login reqired to add review", isPresented: $showAlert, actions: {
                              Button("Cancel", role: .cancel, action: {})

                              Button("Login", action: {})
                            }, message: {
                              Text("")
                            })
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(15)
                        .padding(.horizontal,90)
                        .foregroundColor(.white)
                        .background(Color("coreOrange")
                            .cornerRadius(25))
                        .padding(.bottom)

                    }
                    
                    HStack
                    {
                        NavigationLink("Reviews", destination: ReviewView())
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    
                    ScrollView(.horizontal,showsIndicators: false)
                    {
                        HStack{
                            VStack
                            {
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
                                }.frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                Text("Really convenient and the points system helps build loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out more remote.")
                                    .frame(width: 300, height: 80,alignment: .topLeading)
                                    .minimumScaleFactor(0.5)
                            }
                            
                            VStack
                            {
                                HStack{
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    VStack{
                                        Text("Rupaj Sen")
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                        Text("21/06/2020")
                                            .font(.system(size: 12, weight: .thin, design: .rounded))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                    }
                                }
                                HStack{
                                    Image(systemName: "star.fill")
                                        .symbolRenderingMode(.multicolor)
                                    Text("2.5")
                                        .font(.system(size: 14, weight: .thin, design: .rounded))
                                }.frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                Text("Got an intro offer of 50% off first order that did not work... I have scaled the app to find a contact us button but nothing is there to contact the devs")
                                    .frame(width: 320, height: 80,alignment: .topLeading)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                    }
                    HStack
                    {
                        Text("Must Haves")
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                        Image(systemName: "chevron.forward")
                    }
                    .padding(.top)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    
                    ScrollView(.horizontal,showsIndicators: false)
                    {
                        HStack{
                            VStack
                            {
                                Image("dalMakhni")
                                    .resizable()
                                    .frame(width:280,height: 200)
                                Text("Dal Makhni")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.bottom,2)
                                HStack{
                                    Image(systemName: "star.fill")
                                        .symbolRenderingMode(.multicolor)
                                    Text("5")
                                        .font(.system(size: 14, weight: .thin, design: .rounded))
                                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                
                            }
                                
                            VStack
                            {
                                Image("fishFry")
                                    .resizable()
                                    .frame(width:280,height: 200)
                                Text("Fish Fry")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.bottom,2)
                                HStack{
                                    Image(systemName: "star.fill")
                                        .symbolRenderingMode(.multicolor)
                                    Text("4.5")
                                        .font(.system(size: 14, weight: .thin, design: .rounded))
                                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                
                            }
                        }
                    }
                    
                    Spacer()
                    
                }.padding(100)

            }
            .ignoresSafeArea()
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(Color("backgroundColor"))
        

    }
}

#Preview {
    AboutView()
}
