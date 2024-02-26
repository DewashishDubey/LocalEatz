//
//  EditProfile.swift
//  LocalEatz
//
//  Created by Rupaj Sen on 09/01/24.
//

import Foundation
import SwiftUI
struct EditProfile: View {
    
    @State private var firstName=""
    @State private var lastName=""
    @State private var bday = Date()
    @State private var addr=""
    
    
    @State private var phoneNumber = ""
    @State private var email = ""
    
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    
                    
                    Text("Account")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                
                Image("profileImage")
                    .frame(width: 100,height: 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .padding()
                
                Form{
                    Section(header: Text("PERSONAL INFORMATION")){
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        DatePicker("Birthdate",selection: $bday, displayedComponents: .date)
                        TextField("Address", text: $addr)
                    }
                    
                    Section(header: Text("CONTACT INFORMATION")){
                        TextField("Contact Number", text: $phoneNumber )
                        TextField("EMail ID", text: $email)
                    }
                    
                }
                
                HStack{
                    Text("Update")
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
            .background(Color("backgroundColor"))
            
            
            
        }
    }
        
}

#Preview {
    EditProfile()
}
