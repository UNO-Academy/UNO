//
//  PopulateDatabase.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 28/11/22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class PopulateDatabase {
    let crudService: CRUDServices
    let collectionRef: CollectionReference

    init() {
        crudService = CRUDServices.shared
        collectionRef = Firestore.firestore().collection(CollectionNames.experience.rawValue)
    }

    func populate(data: [String: Any]) async throws {
        try await crudService.createDocument(collectionRef: collectionRef, data: data)
    }

    /*
     TODO: criar lógica que transforma json em dicionário e instânciar em alguma view um objeto dessa classe para popular o banco
     */
}
