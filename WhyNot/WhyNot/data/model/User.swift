//
//  User.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 21/10/22.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Encodable, Decodable, UpdatableIdentifiable {
    @DocumentID var id: String?
    let name: String
    let profilePicture: String
    let lastPictureUpdate: Date
    let friendsID: [String]
    let mementosID: [String]
    let interestExperiencesID: [String]
}

enum UserFields: String {
    case name
    case profilePicture
    case lastPictureUpdate
    case friendsID
    case mementosID
    case interestExperiencesID
}
