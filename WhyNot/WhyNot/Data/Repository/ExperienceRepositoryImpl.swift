//
//  Repository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import FirebaseFirestore

class ExperienceRepositoryImpl: ExperienceRepository {

    let experienceAPI: ExperienceAPI
    var experiencesList: [Experience]?

    init() {
        let crudService = CRUDServices()
        let db = Firestore.firestore()
        experienceAPI = ExperienceAPI(crudService: crudService, db: db)
    }

    func fetchExperiences() async throws -> [Experience] {
        guard let list = experiencesList else {
            let list = try await experienceAPI.getActiveExperiences()
            experiencesList = list
            return list
        }
        return list
    }
}
