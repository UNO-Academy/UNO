//
//  Api.swift
//  WhyNot
//
//  Created by Fernando Santos on 10/10/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit

struct User: Codable {
    @DocumentID var id: String?
    var name: String
}

class Api {
    
    func fetchUser(documentId: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("User").document(documentId)
        
        docRef.getDocument { document, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let document = document {
                    let id = document.documentID
                    let data = document.data()
                    let name = data?["name"]
                }
            }
        }
    }
}
