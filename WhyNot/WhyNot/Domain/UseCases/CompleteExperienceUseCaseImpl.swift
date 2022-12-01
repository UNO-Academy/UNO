//
//  CompleteExperienceUseCaseImpl.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 01/12/22.
//

import Foundation

class CompleteExperienceUseCaseImpl {
    let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(_ experience: Experience) async throws {
        guard let id = experience.id else { throw OperationError.idNotFound }
        try await userRepository.completeExperience(id)
    }
}
