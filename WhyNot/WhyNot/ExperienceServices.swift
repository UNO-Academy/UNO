//
//  ExperienceServices.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 11/10/22.
//

import Firebase

class ExperienceServices {
    
    func update(docRef: DocumentReference, data: [String : Any]) async {
        do {
            try await docRef.updateData(data)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func delete(docRef: DocumentReference) async {
        do {
            try await docRef.delete()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
