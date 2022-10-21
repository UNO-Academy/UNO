//
//  ExperienceAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ExperienceAPI {

    private let crudService: CRUDServices
    private let collectionReference: CollectionReference

    init(crudService: CRUDServices, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection("Experience")
    }

    func getActiveExperiences() async throws -> [Experience?] {
        return try await crudService.readDocumentsFilteredBy(
            collectionRef: collectionReference,
            field: "isActive",
            value: true
        ).map({
            return $0.toObject()
        })
    }

    func getExperiencesByIdList(_ idList: [String]) async throws -> [Experience?] {
        return try await crudService.readDocumentsByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return $0?.toObject()
        })
    }
}
