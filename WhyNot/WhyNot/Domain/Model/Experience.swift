//
//  Experience.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Experience: Codable, Identifiable {
    @DocumentID var id: String?
    let category: String
    let cost: Int
    let description: String
    let duration: Int
    let effort: Int
    let expirationDate: Timestamp
    let isActive: Bool
    let name: String
    var friendsInterested: [User]?

    enum CodingKeys: String, CodingKey {
        case id
        case category
        case cost
        case description
        case duration
        case effort
        case expirationDate
        case isActive
        case name
        case friendsInterested
    }
}

enum ExperienceFields: String {
    case name
    case description
    case effort
    case duration
    case cost
    case category
    case isActive
    case expirationDate
}
