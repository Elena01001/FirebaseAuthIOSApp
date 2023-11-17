//
//  HomeViewModel.swift
//  FirebaseAuthApp
//
//  Created by Elena Smelkova on 14.11.2023.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
