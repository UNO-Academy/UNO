//
//  Api.swift
//  WhyNot
//
//  Created by Fernando Santos on 10/10/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseCore
import UIKit
import SwiftUI

struct Experience: Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var effort: Int
    var duration: Int
    var category: String
}

class DataBase {
    static let shared = DataBase()
    let db: Firestore?
    
    private init() {
        FirebaseApp.configure()
        db = Firestore.firestore()
    }
    
    func getDocumentByID(collectionName: String, documentId: String, completion: @escaping(_ result: [String: Any]?) -> Void) {
        let docRef = db!.collection(collectionName).document(documentId)
        docRef.getDocument { document, error in
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                if let document = document {
                    
                    let id = document.documentID
                    let data = document.data()
                    completion(data)
                }
            }
        }
    }
    
    
    func getAllDocumentsOfACollection(collectionName: String, completion: @escaping(_ result: [String: Any]?) -> Void) {
        let docRef = db!.collection(collectionName)
        docRef.getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let data = querySnapshot?.documents
            }
        }
    }
    
    
    func getAllDocumentsFilterBy(collectionName: String, field: String, value: Any, completion: @escaping(_ result: [String: Any]?) -> Void) {
        let docRef = db!.collection(collectionName).whereField(field, isEqualTo: value)
        
        docRef.getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let data = querySnapshot?.documents
            }
        }
    }
    
    
    func setData(collectionName: String, data: [String: Any], completion: @escaping(_ result: [String: Any]?) -> Void) {
        db!.collection(collectionName).addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Deu certo")
            }
        }
    }
}
