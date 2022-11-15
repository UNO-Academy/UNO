//
//  QueryDocumentSnapshot+Extension.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 17/10/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

extension DocumentSnapshot {
    func toObject<T: Decodable>() throws -> T  where T: UpdatableIdentifiable, T.ID == String? {
        do {
            let object = try self.data(as: T.self)
            return object
        } catch {
            throw error
        }
    }
}
