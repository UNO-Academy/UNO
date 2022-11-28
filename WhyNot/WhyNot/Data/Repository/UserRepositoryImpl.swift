//
//  UserRepositoryImpl.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/11/22.
//

import Foundation
import FirebaseFirestore

enum OperationError: Error {
    case userNotLogged
    case idNotFound
}

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

    func getFriendsInteretedInExperience(_ experienceId: String) async throws -> [User] {
        guard let userId = self.user?.id else { return [] }
        var friends = try await api.getUserFriendsInterestedInAnExperience(userID: userId, experienceID: experienceId)
        let picturesPath = friends.map { $0.profilePictureID }
        try await api.getProfilePictureByPathList(picturesPath) { data in
            for i in 0 ..< data.count {
                friends[i].profilePicture = data[i]
            }
        }
        return friends
    }

    func likeExperience(_ experienceId: String) async throws {
        guard let userId = self.user?.id else { throw OperationError.userNotLogged }
        try await api.showInterest(userID: userId, experienceID: experienceId)
    }
}
