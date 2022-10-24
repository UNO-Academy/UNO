//
//  MementoAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/10/22.
//

import Foundation
import FirebaseFirestore

class MementoAPI {

    private let crudService: CRUDServices
    private let collectionReference: CollectionReference

    init(crudService: CRUDServices, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection("Memento")
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
            return $0?.toObject()
        })
    }
}
