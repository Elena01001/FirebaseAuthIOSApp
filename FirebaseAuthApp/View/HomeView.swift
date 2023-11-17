//
//  HomeView.swift
//  FirebaseAuthApp
//
//  Created by Elena Smelkova on 09.11.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSignInView: Bool = false
    @State private var showSignUpView: Bool = false
    @Binding var showHomeView: Bool
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.mint, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationStack {
                VStack {
                    Text("Hello, have a good day!")
                        .padding()
                    Image("HomeViewImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Capsule())
                        .padding()
                    Button(action: {
                        Task {
                            do {
                                try viewModel.logOut()
                                showSignInView = true
                            } catch {
                                print(error)
                            }
                        }
                    }, label: {
                        Text("Log Out")
                            .foregroundColor(.white)
                    })
                }
            }
        } .onAppear {
            let authentictedUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authentictedUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                SignInView(showSignInView: $showSignInView)
            }
        }
    }
}

