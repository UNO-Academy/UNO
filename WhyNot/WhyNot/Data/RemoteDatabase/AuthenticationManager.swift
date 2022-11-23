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
        do {
            return try await auth.createUser(withEmail: email, password: password)
        } catch {
            throw error
        }
    }

    func signIn(_ email: String, _ password: String) async throws -> String {
        do {
            let result: AuthDataResult = try await auth.signIn(withEmail: email, password: password)
            return result.user.uid
        } catch {
            throw error
        }
    }

    func signOut() throws {
        do {
            try auth.signOut()
        } catch {
            throw error
        }
    }
}
