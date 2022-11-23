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

    private let crudService = CRUDServices.shared
    private let collectionReference: CollectionReference

    init() {
        collectionReference = Firestore.firestore().collection(CollectionNames.experience.rawValue)
    }

    func getActiveExperiences() async throws -> [Experience] {
        return try await crudService.readDocumentsFilteredBy(
            collectionRef: collectionReference,
            field: ExperienceFields.isActive.rawValue,
            value: true
        ).map({
            return try $0.toObject()
        })
    }

    func getExperiencesByIdList(_ idList: [String]) async throws -> [Experience?] {
        return try await crudService.readDocumentsByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return try $0?.toObject()
        })
    }
}
