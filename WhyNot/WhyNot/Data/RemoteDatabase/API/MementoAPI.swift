//
//  MementoAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/10/22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class MementoAPI {

    private let crudService: CRUDServices
    private let collectionReference: CollectionReference

    init(crudService: CRUDServices, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection(CollectionNames.memento.rawValue)
    }

    func createMemento(_ memento: Memento) async throws {

        guard let data = memento.encode() else { return }

        return try await crudService.createDocument(
            collectionRef: collectionReference,
            data: data
        )
    }

    func getMementosByIdList(_ idList: [String]) async throws -> [Memento?] {

        return try await crudService.readDocumentsByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return try $0?.toObject()
        })
    }
}
