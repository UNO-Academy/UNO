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

    func signIn(_ email: String, _ password: String, completion: @escaping (Result<String, Error>) -> Void ) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            let userID = authResult?.user.uid ?? "Unknown"
            completion(.success(userID))
        }
    }

    func signOut() throws {
        try auth.signOut()
    }
}
