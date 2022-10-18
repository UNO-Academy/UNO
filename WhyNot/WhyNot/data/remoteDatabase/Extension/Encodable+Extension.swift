//
//  Encode.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/10/22.
//

import Foundation
import FirebaseFirestore

extension Encodable {

    func encode() -> [String: Any]? {

        do {
            return try Firestore.Encoder().encode(self)
        } catch {
            return nil
        }
    }
}
