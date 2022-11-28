//
//  Experience.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class Experience: Codable, Identifiable {
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
    var wasLiked: Bool? = false

    init(
        category: String,
        cost: Int,
        description: String,
        duration: Int,
        effort: Int,
        expirationDate: Timestamp,
        isActive: Bool,
        name: String,
        friendsInterested: [User],
        wasLiked: Bool
    ) {
        self.category = category
        self.cost = cost
        self.description = description
        self.duration = duration
        self.effort = effort
        self.expirationDate = expirationDate
        self.isActive = isActive
        self.name = name
        self.friendsInterested = friendsInterested
        self.wasLiked = wasLiked
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
