//
//  QueryDocumentSnapshot+Extension.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 17/10/22.
//

import FirebaseFirestore

extension DocumentSnapshot {
    func toObject<T: Decodable>() -> T?  where T: UpdatableIdentifiable, T.ID == String? {
        do {
            var object = try Firestore.Decoder().decode(T.self, from: data()!)
            object.id = self.documentID
            return object
        } catch {
            print("Não foi possível decodificar o documento")
            return nil
        }
    }
}
