//
//  PopulateDatabase.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 28/11/22.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
// swiftlint:disable force_cast
class PopulateDatabaseControl {
    let crudService: CRUDServices
    let collectionRef: CollectionReference
    
    
    init() {
        crudService = CRUDServices.shared
        collectionRef = Firestore.firestore().collection(CollectionNames.experience.rawValue)
    }
    
    func populate(data: [String: Any]) async throws {
        try await crudService.createDocument(collectionRef: collectionRef, data: data)
    }
    
    func convertToDictionary(jsonString: String) -> [String: Any]? {
        if let data = jsonString.data(using: .utf8) {
            do {
                var d = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                var da = DateFormatter()
                da.dateFormat = "yyyy-MM-dd"
                d[ExperienceFields.expirationDate.rawValue] = da.date(from: d[ExperienceFields.expirationDate.rawValue] as! String)
                return d
            } catch {
                print(error.localizedDescription)
            }
        }
        print("formato errado")
        return nil
    }
    
    func populateFromString(text: String) async {
        if let data = convertToDictionary(jsonString: text) {
            do {
                try await populate(data: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("falhou")
        }
    }
}
