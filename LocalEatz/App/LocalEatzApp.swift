//
//  MapViewApp.swift
//  MapView
//
//  Created by Rupaj Sen on 16/12/23.
//

import SwiftUI
import Firebase

@main
struct LocalEatzApp: App {
    //@StateObject var viewModel = AuthViewModel()
    init()
    {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            FirstScreen()
                .environmentObject(AuthViewModel())
        }
    }
}
