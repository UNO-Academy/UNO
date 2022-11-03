//
//  AuthenticationManager.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 01/11/22.
//

import FirebaseAuth

class AuthenticationManager {
    let auth = Auth.auth()

    func createAccount(_ email: String, _ password: String) async throws -> AuthDataResult {
        return try await auth.createUser(withEmail: email, password: password)
    }

    func signIn(_ email: String, _ password: String) async throws -> String {
        let result: AuthDataResult = try await auth.signIn(withEmail: email, password: password)
        return result.user.uid
    }

    func signOut() throws {
        try auth.signOut()
    }
}
