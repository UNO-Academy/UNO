//
//  UserRepositoryImpl.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/11/22.
//

import Foundation
import FirebaseFirestore

class UserRepositoryImpl: UserRepository {

    private var isLogged: Bool = false
    private var user: User?

    private let api = UserAPI()
    private let authManager = AuthenticationManager()

    func isUserLogged() -> Bool {
        return isLogged
    }

    func getLoggedUser() -> User? {
        return user
    }

    func createUser(email: String, password: String, user: User) async throws {
        let result = try await authManager.createAccount(email, password)
        try await api.createUser(id: result.user.uid, user: user)
    }
}
