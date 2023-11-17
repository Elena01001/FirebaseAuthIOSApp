//
//  SignInViewModel.swift
//  FirebaseAuthApp
//
//  Created by Elena Smelkova on 13.11.2023.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    
    func signUp() async throws {
        try await AuthenticationManager.shared.createUser(email: userName, password: password)
    }
}
