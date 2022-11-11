//
//  QueryDocumentSnapshot+Extension.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 17/10/22.
//

import FirebaseFirestore

extension DocumentSnapshot {
    func toObject<T: Decodable>() throws -> T  where T: UpdatableIdentifiable, T.ID == String? {
        do {
            print(self.data())
            var object = try Firestore.Decoder().decode(T.self, from: self.data())
            object.id = self.documentID
            return object
        } catch {
            print("Não foi possível decodificar o documento")
            throw error
        }
    }
}
