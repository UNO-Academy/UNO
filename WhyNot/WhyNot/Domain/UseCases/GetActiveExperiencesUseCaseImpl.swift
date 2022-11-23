//
//  GetActiveExperiencesUseCaseImpl.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/11/22.
//

import Foundation

class GetActiveExperiencesUseCaseImpl: GetActiveExperiencesUseCase {
    let experienceRepository: ExperienceRepository
    let userRepository: UserRepository

    init(experienceRepository: ExperienceRepository, userRepository: UserRepository) {
        self.experienceRepository = experienceRepository
        self.userRepository = userRepository
    }

    func execute() async throws -> ActiveExperiences {
        let list = try await experienceRepository.fetchExperiences()

        guard let user = userRepository.getLoggedUser() else {
            return ActiveExperiences(toDoExperiences: list, doneExperiences: [])
        }

        return list.reduce(ActiveExperiences(toDoExperiences: [], doneExperiences: [])) { experiences, item in
            var activeExperiences = experiences

            if user.doneExperiencesID.contains(item.id!) {
                activeExperiences.doneExperiences.append(item)
            } else {
                activeExperiences.toDoExperiences.append(item)
            }

            return activeExperiences
        }
    }
}
