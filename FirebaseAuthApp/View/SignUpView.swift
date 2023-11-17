//
//  SignUpView.swift
//  FirebaseAuthApp
//
//  Created by Elena Smelkova on 13.11.2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Binding var showSignUpView: Bool
    @State private var showHomeView: Bool = false
    @State private var showErrorAlert = false
   
    var body: some View {
        VStack(spacing: 20) {
            Text("Создать аккаунт")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        VStack(alignment: .leading, spacing: 10) {
            Text("Username")
            TextField("Введите логин", text: $viewModel.userName)
            Text("Password")
            SecureField("Введите пароль", text: $viewModel.password)
        } .padding()
        
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showHomeView = true
                    } catch {
                        print(error)
                        showErrorAlert = true
                    }
                }
            } label: {
                Text("Создать")
                    .frame(height: 60)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.mint)
                    .clipShape(Capsule())
                    .font(.headline)
                    .foregroundColor(.black)
            } .padding()
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Аккаунт с таким e-mail уже существует!"), message: Text("Введите другой e-mail"), dismissButton: .cancel())
            }
            .fullScreenCover(isPresented: $showHomeView) {
                NavigationStack {
                    HomeView(showHomeView: $showHomeView)
                }
            }
    }
}

