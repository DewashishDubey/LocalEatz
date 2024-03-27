//
//  AddFoodie.swift
//  MapView
//
//  Created by Dewashish Dubey on 03/01/24.
//

import SwiftUI
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct AddFoodie: View {
    @State private var friendName = ""
    @State private var showDetails = false
    var body: some View {
        NavigationView{
            VStack{
//                ZStack {
//                    Text("Add Friends")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }
//                .frame(maxWidth: .infinity, alignment: .center)
//                .padding(.top)
                ScrollView{
                    Text("Name of friend")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Enter Friend Name", text: $friendName)
                        .padding([.leading,.trailing,.bottom])
                    //.padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Find Friend")
                    {
                        showDetails.toggle()
                    }
                    .buttonStyle(GrowingButton())
                    .padding(.bottom)
                    
                    if showDetails {
                        HStack{
                            Image("person2")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width: 70, height: 70)
                                .padding(.trailing)
                            VStack{
                                Text("Dewashish Dubey")
                                    .font(.system(size:  21))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Muzaffarpur, Bihar")
                                    .font(.system(size: 16, weight: .thin, design: .rounded))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Button("Add Friend"){}
                                    .buttonStyle(GrowingButton())
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                        }
                        .padding()
                        .frame(maxWidth: 350,maxHeight:160,alignment:.leading)
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.bottom)
                    }
                    Spacer()
                }
                
            }
            .background(Color("backgroundColor"))
        }
        .navigationTitle("Add Foodie")
        .navigationBarTitleDisplayMode(.automatic)
    
    }
}

#Preview {
    AddFoodie()
}
