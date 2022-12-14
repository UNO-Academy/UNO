//
//  Memento.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Memento: Codable {
    @DocumentID var id: String?
    let caption: String
    let userID: [String]
    let experienceID: String
    let imagesID: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case caption
        case userID
        case experienceID
        case imagesID
    }
}

enum MementoFields: String {
    case caption
    case userID
    case experienceID
    case imagesID
}
