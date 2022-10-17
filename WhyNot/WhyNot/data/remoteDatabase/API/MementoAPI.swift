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

    func createMemento(_ memento: Memento) {

        return crudService.createDocument(
            collectionReference: collectionReference,
            data: Firestore.Encoder().encode(memento)
        )
    }

    func getMementosByIdList(_ idList: [String]) async throws -> [Memento] {

        return crudService.getDocumentsByIdList(
            collectionReference: collectionReference,
            idList: [String]
        )
    }
}
