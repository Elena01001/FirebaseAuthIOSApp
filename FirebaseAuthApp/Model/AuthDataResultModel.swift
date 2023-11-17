//
//  AuthDataResultModel.swift
//  FirebaseAuthApp
//
//  Created by Elena Smelkova on 17.11.2023.
//

import Foundation
import Firebase
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
