//
//  AuthenticationManager.swift
//  FirebaseAuth
//
//  Created by Elena Smelkova on 07.11.2023.
//

import Foundation
import Firebase
import FirebaseAuth



final class AuthenticationManager {
    
    static let shared = AuthenticationManager() // лучше использовать Dependency Injection вместо синглтона
    private init() { }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel { // не асинк, тк не идет на сервер Firebase юзера проверять, проверяет локально
        guard let user = Auth.auth().currentUser else {
            throw URLError (.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
