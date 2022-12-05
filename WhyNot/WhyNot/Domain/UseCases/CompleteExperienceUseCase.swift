//
//  CompleteExperienceUseCase.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 01/12/22.
//

import Foundation

protocol CompleteExperienceUseCase {
    func execute(_ experience: Experience) async throws
}
