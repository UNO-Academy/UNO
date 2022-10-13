//
//  ExperienceAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation

class ExperienceAPI {

    private let collectionName: String = "Experience"
    private let crudService: AnyClass?

    func getActiveExperiences() async throws -> [Experience] {

        return crudService.getFilteredItems(
            collectionName: collectionName,
            field: "isActive",
            value: true
        )
    }

    func getExperiencesByIdList() async throws -> [Experience] {

        return crudService.getItemsByIdList(
            collectionName: collectionName,
            idList: [String]
        )
    }
}
