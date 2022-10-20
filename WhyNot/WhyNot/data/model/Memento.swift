//
//  Memento.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Memento: Encodable, Decodable, UpdatableIdentifiable {
    @DocumentID var id: String?
    let caption: String
    let userId: [String]
    let experienceId: String
    let imagesId: [String]
}
