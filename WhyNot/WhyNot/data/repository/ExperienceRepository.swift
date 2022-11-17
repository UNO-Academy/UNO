//
//  ExperienceRepository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/11/22.
//

import Foundation

protocol ExperienceRepository {
    func getActiveExperiences() async throws -> ActiveExperiences
}
