//
//  SignUpViewModel.swift
//  FirebaseAuthApp
//
//  Created by Elena Smelkova on 09.11.2023.
//

import Foundation


@MainActor
final class SignInViewModel: ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthenticationManager.shared.signInUser(email: userName, password: password)
    }
}
