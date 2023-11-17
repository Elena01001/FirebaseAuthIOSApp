//
//  FirebaseAuthApp.swift
//  FirebaseAuth
//
//  Created by Elena Smelkova on 07.11.2023.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseAuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SignInView(showSignInView: .constant(false))
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase Configured!!!")
        return true
    }
}
