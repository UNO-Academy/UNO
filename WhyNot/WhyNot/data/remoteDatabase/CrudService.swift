//
//  Api.swift
//  WhyNot
//
//  Created by Fernando Santos on 10/10/22.
//

import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift
import FirebaseCore
import UIKit
import SwiftUI

class CrudService {

    let storage: Storage?
    
    init() {
        storage = Storage.storage()
    }
    
    func getDocumentByID(
        collectionRef: CollectionReference,
        documentId: String
    ) async throws -> DocumentSnapshot? {

        do {
            return try await collectionRef.document(documentId).getDocument()
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }

    func getDocumentByIDList(
        collectionRef: CollectionReference,
        documentIdList: [String]
    ) async throws -> [DocumentSnapshot?] {

        try await documentIdList.asyncMap {
            try await getDocumentByID(collectionRef: collectionRef, documentId: $0)
        }
    }
    
    
    func getAllDocumentsFilterBy(
        collectionRef: CollectionReference,
        field: String,
        value: Any
    ) async throws -> [QueryDocumentSnapshot] {

        do {
            let docRef = collectionRef.whereField(field, isEqualTo: value)
            return try await docRef.getDocuments().documents

        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
    func createDocument(
        collectionRef: CollectionReference,
        data: [String: Any]
    ) async {

        do {
            _ = try await collectionRef.addDocument(data: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func updateDocument(
        collectionRef: DocumentReference,
        data:[String: Any])
    async {
        
        do {
            try await collectionRef.updateData(data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func uploadImage() {
       let reference  = storage?.reference()
       let image = URL(string: "salsicha")!
    print("a")
    }
}
