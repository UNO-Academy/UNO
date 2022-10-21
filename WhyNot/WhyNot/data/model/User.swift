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
    let friendID: [String]
    let mementosID: [String]
    let interestExperiencesID: [String]
}
