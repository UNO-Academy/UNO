//
//  UserAPI.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 21/10/22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserAPI {

    private let crudService: CRUDServices
    private let collectionReference: CollectionReference

    init(crudService: CRUDServices, db: Firestore) {
        self.crudService = crudService
        collectionReference = db.collection(CollectionNames.user.rawValue)
    }

    func createUser(user: User) async throws {
        guard let data = user.encode() else {
            print("Não foi possivel converter o objeto em documento")
            return
        }
        return try await crudService.createDocument(collectionRef: collectionReference, data: data)
    }

    func getUserByID(userID: String) async throws -> User? {
        return try await
            (crudService.readDocumentByID(collectionRef: collectionReference, documentId: userID))?.toObject()
    }

    func updateUser(userID: String, data: [String: Any]) async throws {
        if let docRef = crudService.getDocumentReferenceByID(collectionRef: collectionReference, documentID: userID) {
            try await crudService.updateDocument(docRef: docRef, data: data)
        }
    }

    func addFriend(userID: String, friendID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(collectionRef: collectionReference, documentID: userID) {
            try await crudService.pushInDocumentArray(docRef: docRef, field: UserFields.friendsID.rawValue, value: friendID)
        }
    }

    func removeFriend(userID: String, friendID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(collectionRef: collectionReference, documentID: userID) {
            try await crudService.popInDocumentArray(docRef: docRef, field: UserFields.friendsID.rawValue, value: friendID)
        }
    }

    func showInterest(userID: String, experienceID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(collectionRef: collectionReference, documentID: userID) {
            try await crudService.pushInDocumentArray(docRef: docRef, field: UserFields.interestExperiencesID.rawValue, value: experienceID)
        }
    }

    func removeInterest(userID: String, experienceID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(collectionRef: collectionReference, documentID: userID) {
            try await crudService.popInDocumentArray(docRef: docRef, field: UserFields.interestExperiencesID.rawValue, value: experienceID)
        }
    }

    func getUserByIDList(_ idList: [String]) async throws -> [User?] {
        return try await crudService.readDocumentsByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return $0?.toObject()
        })
    }
}
