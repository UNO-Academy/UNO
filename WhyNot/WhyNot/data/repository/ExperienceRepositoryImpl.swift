//
//  Repository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import FirebaseFirestore

class ExperienceRepositoryImpl: ExperienceRepository {
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
            return ActiveExperiences(toDo: list, done: [])
        }

        return list.reduce(ActiveExperiences(toDo: [], done: [])) { experiences, item in
            var activeExperiences = experiences

            if user.doneExperiencesID.contains(item.id!) {
                activeExperiences.doneExperiences.append(item)
            } else {
                activeExperiences.toDoExperiences.append(item)
            }

            return activeExperiences
        }
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
