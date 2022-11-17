//
//  AuthenticationManager.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 01/11/22.
//

import FirebaseAuth

class AuthenticationManager {

    let auth = Auth.auth()
    var isLogged: Bool = false

    func createAccount(_ email: String, _ password: String) async throws -> AuthDataResult {
        do {
            isLogged = true
            return try await auth.createUser(withEmail: email, password: password)
        } catch {
            throw error
        }
    }

    func signIn(_ email: String, _ password: String) async throws -> String {
        do {
            let result: AuthDataResult = try await auth.signIn(withEmail: email, password: password)
            isLogged = true
            return result.user.uid
        } catch {
            throw error
        }
    }

    func signOut() throws {
        do {
            try auth.signOut()
            isLogged = false
        } catch {
            throw error
        }
    }
}
