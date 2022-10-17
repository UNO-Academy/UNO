//
//  ExperienceAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestore

class ExperienceAPI {

    private let crudService: DataBase
    private let collectionReference: CollectionReference

    init(crudService: DataBase, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection("Experience")
    }

    func getActiveExperiences() async throws -> [Experience] {

        return crudService.getAllDocumentsFilterBy(
            collectionName: collectionReference,
            field: "isActive",
            value: true
        )
    }

    func getExperiencesByIdList(_ idList: [String]) async throws -> [Experience] {

        return crudService.getDocumentsByIdList(
            collectionName: collectionReference,
            idList: [String]
        )
    }
}
