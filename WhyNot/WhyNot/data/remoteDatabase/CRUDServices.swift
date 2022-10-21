//
//  CRUDServices.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 11/10/22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class CRUDServices {

    func createDocument(collectionRef: CollectionReference, data: [String: Any]) async throws {
        do {
            _ = try await collectionRef.addDocument(data: data)
        } catch {
            print((error.localizedDescription))
            throw error
        }
    }

    func readDocumentByID(collectionRef: CollectionReference, documentId: String) async throws -> DocumentSnapshot? {
        do {
            return try await collectionRef.document(documentId).getDocument()
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }

    func getDocumentReferenceByID(collectionRef: CollectionReference, documentID: String) -> DocumentReference? {
        let document: DocumentReference = collectionRef.document(documentID)
        return document
    }

    func readDocumentsByIDList(collectionRef: CollectionReference, documentIdList: [String])
        async throws -> [DocumentSnapshot?] {
        try await documentIdList.asyncMap {
            try await readDocumentByID(collectionRef: collectionRef, documentId: $0)
        }
    }

    func readDocumentsFilteredBy(collectionRef: CollectionReference, field: String, value: Any)
        async throws -> [QueryDocumentSnapshot] {
        do {
            let docRef = collectionRef.whereField(field, isEqualTo: value)
            return try await docRef.getDocuments().documents
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

    func updateDocument(docRef: DocumentReference, data: [String: Any]) async throws {
        do {
            try await docRef.updateData(data)
        } catch {
            print("\(error.localizedDescription)")
            throw error
        }
    }

    func pushInDocumentArray(docRef: DocumentReference, field: String, value: Any) async throws {
        do {
            try await docRef.updateData([field: FieldValue.arrayUnion([value])])
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
