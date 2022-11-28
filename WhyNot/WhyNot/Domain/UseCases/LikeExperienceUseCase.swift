//
//  LikeExperienceUseCase.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 25/11/22.
//

import Foundation

protocol LikeExperienceUseCase {
    func execute(_ experience: Experience) async throws
}
