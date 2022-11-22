//
//  QueryDocumentSnapshot+Extension.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 17/10/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

extension DocumentSnapshot {

    func toObject<T: Decodable>() throws -> T {
        do {
            return try self.data(as: T.self)
        } catch {
            throw error
        }
    }
}
