//
//  RegistrationView.swift
//  LocalEatz
//
//  Created by Dewashish Dubey on 25/02/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack
        {
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 120)
                .padding(.vertical,32)
            
            VStack(spacing:24)
            {
                InputView(text: $email, title: "email address", placeholder: "name@example.com", isSecureField: false)
                    .autocapitalization(.none)
                
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name", isSecureField: false)
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                
                ZStack(alignment : .trailing)
                {
                    InputView(text: $confirmPassword, title: "Password", placeholder: "Confirm your password", isSecureField: true)
                    
                    if(!password.isEmpty && !confirmPassword.isEmpty)
                    {
                        if(password == confirmPassword)
                        {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        }
                        else
                        {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top,12)
            Button
            {
                Task{
                    try await viewModel.createUser(withEmail:email,
                                                   password: password,
                                                   fullname: fullname)
                }
            } label:{
                HStack
                {
                    Text("Sign up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-32,height: 48)
            }
            .background(Color.blue)
            //.disabled(formIsValid)
           // .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top,24)
            
            Spacer()
            Button
            {
                dismiss()
            } label: {
                HStack(spacing:3)
                {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

/*extension RegistrationView : AuthenticationFormProtocol
{
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count>5 &&
        password == confirmPassword &&
        !fullname.isEmpty
    }
    
    
}*/


#Preview {
    RegistrationView()
}
