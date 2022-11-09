//
//  Experience.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Experience: Codable, UpdatableIdentifiable {
    @DocumentID var id: String?
    let name: String
    let description: String
    let effort: Int
    let duration: Int
    let cost: Int
    let category: String
    let isActive: Bool
    let expirationDate: Date
}

enum ExperienceFields: String {
    case name
    case description
    case effort
    case duration
    case category
    case isActive
}
