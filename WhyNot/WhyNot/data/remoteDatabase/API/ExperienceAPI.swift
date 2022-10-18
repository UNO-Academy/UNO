//
//  ExperienceAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestore

class ExperienceAPI {

    private let crudService: CrudService
    private let collectionReference: CollectionReference

    init(crudService: CrudService, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection("Experience")
    }

    func getActiveExperiences() async throws -> [Experience?] {

        return try await crudService.getAllDocumentsFilterBy(
            collectionRef: collectionReference,
            field: "isActive",
            value: true
        ).map({
            return $0.toObject()
        })
    }

    func getExperiencesByIdList(_ idList: [String]) async throws -> [Experience?] {

        return try await crudService.getDocumentByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return $0?.toObject()
        })
    }
}
