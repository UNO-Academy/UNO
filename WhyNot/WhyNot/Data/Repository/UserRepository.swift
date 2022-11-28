//
//  UserRepository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/11/22.
//

import Foundation

protocol UserRepository {
    func isUserLogged() -> Bool
    func getLoggedUser() -> User?
    func createUser(email: String, password: String, user: User) async throws
    func getFriendsInteretedInExperience(_ experienceId: String) async throws -> [User]
    func likeExperience(_ experienceId: String) async throws
}
