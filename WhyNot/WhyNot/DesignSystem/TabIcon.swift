//
//  TabIcon.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

enum Tab {
    case search
    case experience
    case profile

    func getIcon() -> Image {
        switch self {
        case .search:
            return Image(systemName: "magnifyingglass")
        case .experience:
            return Image("experience-symbol")
        case .profile:
            return Image(systemName: "person")
        }
    }

    // TODO: colocar aas labels nos localizables
    func getName() -> String {
        switch self {
        case .search:
            return "Pesquisar"
        case .experience:
            return "Experiências"
        case .profile:
            return "Perfil"
        }
    }
}
