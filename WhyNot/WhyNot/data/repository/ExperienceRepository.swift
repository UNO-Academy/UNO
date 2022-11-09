//
//  Repository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import FirebaseFirestore

class ExperienceRepository {
    let userAPI: UserAPI
    let experienceAPI: ExperienceAPI
    
    var experiencesList: [Experience]?
    
    init() {
        let crudService = CRUDServices()
        let db = Firestore.firestore()
        userAPI = UserAPI(crudService: crudService, db: db)
        experienceAPI = ExperienceAPI(crudService: crudService, db: db)
    }
    
    func getToDoExperiences() async throws -> [Experience] {
        let list = try await loadExperiences()
        if !userAPI.isLogged() {
            return list
        }
        let user = userAPI.getLoggedUser()
        return list.filter() {
            user!.interestExperiencesID.contains($0.id!)
        }
    }
    
    func getLivedExperiences() async throws {
        try await loadExperiences()
        
    }
    
    func loadExperiences() async throws -> [Experience] {
        guard let list = experiencesList else {
            let list = try await experienceAPI.getActiveExperiences()
            experiencesList = list
            return list
        }
        return list
    }
}
