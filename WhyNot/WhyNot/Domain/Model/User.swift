//
//  User.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 21/10/22.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Codable, Hashable {
    @DocumentID var id: String?
    let name: String
    let profilePictureID: String
    var profilePicture: Data?
    let lastPictureUpdate: Date
    let friendsID: [String]
    let mementosID: [String]
    let doneExperiencesID: [String]
    let interestExperiencesID: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePictureID
        case profilePicture
        case lastPictureUpdate
        case friendsID
        case mementosID
        case doneExperiencesID
        case interestExperiencesID
    }
}

enum UserFields: String {
    case name
    case profilePicture
    case lastPictureUpdate
    case friendsID
    case mementosID
    case interestExperiencesID
    case doneExperiencesID
}
