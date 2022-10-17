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

//struct Experience: Codable {
//    @DocumentID var id: String?
//    var name: String
//    var description: String
//    var effort: Int
//    var duration: Int
//    var category: String
//}

class DataBase {
    static let shared = DataBase()
    let db: Firestore?
    let storage: Storage?
    
    private init() {
        FirebaseApp.configure()
        db = Firestore.firestore()
        storage = Storage.storage()
    }
    
    func getDocumentByID(collectionRef: CollectionReference, documentId: String) async throws -> DocumentSnapshot? {
        do {
            return try await collectionRef.document(documentId).getDocument()
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
    func getAllDocumentsFilterBy(collectionRef: CollectionReference, field: String, value: Any) async throws -> QuerySnapshot? {
        do {
            let docRef = collectionRef.whereField(field, isEqualTo: value)
            return try await docRef.getDocuments()
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
    func createDocument(collectionRef: CollectionReference, data: [String: Any]) async {
        do {
            _ = try await collectionRef.addDocument(data: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func updateDocument(collectionRef: DocumentReference, data:[String: Any]) async {
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
