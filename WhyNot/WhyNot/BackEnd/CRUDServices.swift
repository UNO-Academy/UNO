//
//  CRUDServices.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 11/10/22.
//

import FirebaseFirestore

class CRUDServices {
    
    func createDocument(collectionRef: CollectionReference, data: [String: Any]) async throws {
        do {
            _ = try await collectionRef.addDocument(data: data)
        } catch {
            print((error.localizedDescription))
            throw error
        }
    }
    
    func readDocumentByID(collectionRef: CollectionReference, documentId: String) async throws -> QueryDocumentSnapshot? {
        do {
            //Se crashar a culpa é do scrum master
            return try await collectionRef.document(documentId).getDocument() as? QueryDocumentSnapshot
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func readDocumentsFilteredBy(collectionRef: CollectionReference, field: String, value: Any) async throws -> QuerySnapshot? {
        do {
            let docRef = collectionRef.whereField(field, isEqualTo: value)
            return try await docRef.getDocuments()
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func readAllDocuments(collectionRef: CollectionReference) async throws -> QuerySnapshot? {
        do {
            return try await collectionRef.getDocuments()
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func updateDocument(docRef: DocumentReference, data: [String : Any]) async throws {
        do {
            try await docRef.updateData(data)
        } catch {
            print("\(error.localizedDescription)")
            throw error
        }
    }
    
    func pushInDocumentArray(docRef: DocumentReference, field: String, value: Any) async throws {
        do {
            try await docRef.updateData([field : FieldValue.arrayUnion([value])])
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func deleteDocument(docRef: DocumentReference) async throws {
        do {
            try await docRef.delete()
        } catch {
            print("\(error.localizedDescription)")
            throw error
        }
    }
}
