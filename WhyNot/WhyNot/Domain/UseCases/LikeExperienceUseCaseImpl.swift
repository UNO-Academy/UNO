//
//  LikeExperienceUseCaseImpl.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 25/11/22.
//

import Foundation

class LikeExperienceUseCaseImpl: LikeExperienceUseCase {
    let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(_ experience: Experience) async throws {
        guard let id = experience.id else { throw OperationError.idNotFound }
        try await userRepository.likeExperience(id)
        experience.wasLiked = true
    }
}
