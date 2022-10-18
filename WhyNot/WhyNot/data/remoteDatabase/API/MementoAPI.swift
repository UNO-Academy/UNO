//
//  MementoAPI.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/10/22.
//

import Foundation
import FirebaseFirestore

class MementoAPI {

    private let crudService: DataBase
    private let collectionReference: CollectionReference

    init(crudService: DataBase, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection("Memento")
    }

    func createMemento(_ memento: Memento) async {

        guard let data = memento.encode() else { return }

        return await crudService.createDocument(
            collectionRef: collectionReference,
            data: data
        )
    }

    func getMementosByIdList(_ idList: [String]) async throws -> [Memento?] {

        return try await crudService.getDocumentByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return $0?.toObject()
        })
    }
}
