//
//  Interface.swift
//  WhyNot
//
//  Created by Luiz Gustavo Silva Aguiar on 17/10/22.
//

protocol UpdatableIdentifiable: Identifiable {
    /// The stable identity of the entity associated with this instance.
    var id: Self.ID { get set }
}

enum CollectionNames: String {
    case experience = "Experience"
    case memento = "Memento"
    case user = "User"
}
