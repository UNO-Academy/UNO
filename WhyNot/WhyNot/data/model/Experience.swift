//
//  Experience.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestoreSwift

protocol UpdatableIdentifiable: Identifiable {
    /// The stable identity of the entity associated with this instance.
    var id: Self.ID { get set }
}

struct Experience: Decodable, UpdatableIdentifiable {
    @DocumentID var id: String?
    let name: String
    let description: String
    let effor: Int
    let duration: Int
    let category: String
    let isActive: Bool
}
