//
//  Repository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import FirebaseFirestore

struct ActiveExperiences {
    let toDoExperiences: [Experience]
    let doneExperiences: [Experience]
}

class ExperienceRepository {
    let userAPI: UserAPI
    let experienceAPI: ExperienceAPI

    var experiencesList: [Experience]?

    init() {
        let crudService = CRUDServices()
        let db = Firestore.firestore()
        let auth = AuthenticationManager()
        userAPI = UserAPI(crudService: crudService, authManager: auth, db: db)
        experienceAPI = ExperienceAPI(crudService: crudService, db: db)
    }

    func getActiveExperiences() async throws -> ActiveExperiences {
        let list = try await loadExperiences()

        guard let user = userAPI.getLoggedUser() else {
            return ActiveExperiences(toDoExperiences: list, doneExperiences: [])
        }

        let toDo = list.filter {
            !user.doneExperiencesID.contains($0.id!)
        }
        let done = list.filter {
            user.doneExperiencesID.contains($0.id!)
        }

        return ActiveExperiences(toDoExperiences: toDo, doneExperiences: done)
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
