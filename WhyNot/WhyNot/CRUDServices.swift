//
//  CRUDServices.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 11/10/22.
//

import Firebase

class CRUDServices {
    
    
    //Não tô achando pq ele tá reclamando do async aqui
    func create(collectionRef: CollectionReference, data: [String : Any]) async {
        do {
            try await _ = collectionRef.addDocument(data: data)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    //Quero encontrar outra forma de fazer pra não precisar devolver nil
    func read(collectionRef: CollectionReference) async throws -> QuerySnapshot? {
        do {
            return try await collectionRef.getDocuments()
        } catch {
            print("\(error.localizedDescription)")
        }
        return nil
    }
    
    func update(docRef: DocumentReference, data: [String : Any]) async {
        do {
            try await docRef.updateData(data)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func delete(docRef: DocumentReference) async {
        do {
            try await docRef.delete()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
