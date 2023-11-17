//
//  AuthenticationView.swift
//  FirebaseAuth
//
//  Created by Elena Smelkova on 07.11.2023.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @Binding var showSignInView: Bool
    @State private var showSignUpView: Bool = false
    @State private var showHomeView: Bool = false
    @State private var showErrorAlert = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Войти")
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
                        try await viewModel.signIn()
                        showHomeView = true
                        showSignInView = false
                    } catch {
                        print(error)
                        showErrorAlert = true
                    }
                }
            } label: {
                Text("Войти")
                    .frame(height: 60)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.mint)
                    .clipShape(Capsule())
                    .font(.headline)
                    .foregroundColor(.black)
            } .padding()
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Неверный логин/пароль!"), message: Text("Попробуйте снова или создайте аккаунт"), dismissButton: .cancel())
                }
            
            Text("ИЛИ")
            HStack {
                Text("Нет аккаунта?")
                Button(action: {
                    showSignUpView = true
                }) {
                    Text ("Создать")
                }
            } .padding()
                .fullScreenCover(isPresented: $showSignUpView) {
                    NavigationStack {
                        SignUpView(showSignUpView: $showSignUpView)
                    }
                }
                .fullScreenCover(isPresented: $showHomeView) {
                    NavigationStack {
                        HomeView(showHomeView: $showHomeView)
                    }
                }
        }
    }
}

