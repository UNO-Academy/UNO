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

    private let crudService = CRUDServices.shared
    private let collectionReference: CollectionReference

    init() {
        collectionReference = Firestore.firestore().collection(CollectionNames.user.rawValue)
    }

    func createUser(id: String, user: User) async throws {
        guard let data = user.encode() else {
            print("Não foi possivel converter o objeto em documento")
            return
        }
        try await crudService.createDocumentWithID(
            collectionRef: collectionReference,
            documentID: id,
            data: data
        )
    }

    func getUserByID(userID: String) async throws -> User? {
        return try await crudService.readDocumentByID(
            collectionRef: collectionReference,
            documentId: userID
        )?.toObject()
    }

    func updateUser(userID: String, data: [String: Any]) async throws {
        if let docRef = crudService.getDocumentReferenceByID(
            collectionRef: collectionReference,
            documentID: userID
        ) {
            try await crudService.updateDocument(docRef: docRef, data: data)
        }
    }

    func addFriend(userID: String, friendID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(
            collectionRef: collectionReference,
            documentID: userID
        ) {
            try await crudService.pushInDocumentArray(
                docRef: docRef,
                field: UserFields.friendsID.rawValue,
                value: friendID
            )
        }
    }

    func removeFriend(userID: String, friendID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(
            collectionRef: collectionReference,
            documentID: userID
        ) {
            try await crudService.popInDocumentArray(
                docRef: docRef,
                field: UserFields.friendsID.rawValue,
                value: friendID
            )
        }
    }

    func showInterest(userID: String, experienceID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(
            collectionRef: collectionReference,
            documentID: userID
        ) {
            try await crudService.pushInDocumentArray(
                docRef: docRef,
                field: UserFields.interestExperiencesID.rawValue,
                value: experienceID
            )
        }
    }

    func removeInterest(userID: String, experienceID: String) async throws {
        if let docRef = crudService.getDocumentReferenceByID(
            collectionRef: collectionReference,
            documentID: userID
        ) {
            try await crudService.popInDocumentArray(
                docRef: docRef,
                field: UserFields.interestExperiencesID.rawValue,
                value: experienceID
            )
        }
    }

    func getUserFriendsInterestedInAnExperience(userID: String, experienceID: String) async throws -> [User] {
        let userData = try await collectionReference.document(userID).getDocument()
        guard var friendsList = userData[UserFields.friendsID.rawValue] as? [String] else { return [] }
        friendsList = try await crudService.friendsInterestedInAnExperience(
            collectionRef: collectionReference,
            friendsID: friendsList,
            experienceID: experienceID
        )
        return try await crudService.readDocumentsByIDList(
            collectionRef: collectionReference,
            documentIdList: friendsList
        ).compactMap({
            try $0?.toObject()
        })
    }

    func getUserByIDList(_ idList: [String]) async throws -> [User?] {
        return try await crudService.readDocumentsByIDList(
            collectionRef: collectionReference,
            documentIdList: idList
        ).map({
            return try $0?.toObject()
        })
    }
}
