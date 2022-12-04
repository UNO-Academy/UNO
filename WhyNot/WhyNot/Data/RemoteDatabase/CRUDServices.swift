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

    static let shared = CRUDServices()

    func createDocument(
        collectionRef: CollectionReference,
        data: [String: Any]
    ) async throws {
        do {
            _ = try await collectionRef.addDocument(data: data)
        } catch {
            throw error
        }
    }

    func createDocumentWithID(
        collectionRef: CollectionReference,
        documentID: String,
        data: [String: Any]
    ) async throws {
        do {
            _ = try await collectionRef.document(documentID).setData(data)
        } catch {
            throw error
        }
    }

    func readDocumentByID(
        collectionRef: CollectionReference,
        documentId: String
    ) async throws -> DocumentSnapshot? {
        do {
            return try await collectionRef.document(documentId).getDocument()
        } catch {
            throw error
        }
    }

    func getDocumentReferenceByID(
        collectionRef: CollectionReference,
        documentID: String
    ) -> DocumentReference? {
        let document: DocumentReference = collectionRef.document(documentID)
        return document
    }

    func readDocumentsByIDList(
        collectionRef: CollectionReference,
        documentIdList: [String]
    )
        async throws -> [DocumentSnapshot?] {
        try await documentIdList.asyncMap {
            try await readDocumentByID(collectionRef: collectionRef, documentId: $0)
        }
    }

    func readDocumentsFilteredBy(
        collectionRef: CollectionReference,
        field: String,
        value: Any
    ) async throws -> [QueryDocumentSnapshot] {
        do {
            let docRef = collectionRef.whereField(field, isEqualTo: value)
            return try await docRef.getDocuments().documents
        } catch {
            throw error
        }
    }

    func readAllDocuments(
        collectionRef: CollectionReference
    ) async throws -> QuerySnapshot? {
        do {
            return try await collectionRef.getDocuments()
        } catch {
            throw error
        }
    }

    func updateDocument(
        docRef: DocumentReference,
        data: [String: Any]
    ) async throws {
        do {
            try await docRef.updateData(data)
        } catch {
            throw error
        }
    }

    func pushInDocumentArray(
        docRef: DocumentReference,
        field: String, value: Any
    ) async throws {
        do {
            try await docRef.updateData([field: FieldValue.arrayUnion([value])])
        } catch {
            throw error
        }
    }

    func popInDocumentArray(
        docRef: DocumentReference,
        field: String, value: Any
    ) async throws {
        do {
            try await docRef.updateData([field: FieldValue.arrayRemove([value])])
        } catch {
            throw error
        }
    }

    func deleteDocument(
        docRef: DocumentReference
    ) async throws {
        do {
            try await docRef.delete()
        } catch {
            throw error
        }
    }
}

extension CRUDServices {
    // For user queries
    func friendsInterestedInAnExperience(
        collectionRef: CollectionReference,
        friendsID: [String],
        experienceID: String) async throws -> [String] {
            var friends: [String] = []
            for id in friendsID {
                guard let document = try await collectionRef.document(id).getDocument().data() else { continue }

                guard let data = document[UserFields.interestExperiencesID.rawValue] as? [String] else { continue }

                if data.contains(experienceID) {
                    friends.append(id)
                }
            }
            return friends
    }
}
