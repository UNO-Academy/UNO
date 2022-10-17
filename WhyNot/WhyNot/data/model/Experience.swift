//
//  Experience.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 13/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Experience {
    @DocumentID var id: String?
    let name: String
    let description: String
    let effor: Int
    let duration: Int
    let category: String
    let isActive: Bool
}
