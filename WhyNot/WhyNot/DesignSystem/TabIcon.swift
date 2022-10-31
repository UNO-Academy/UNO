//
//  TabIcon.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import Foundation

enum Tab {
    case search
    case experience
    case profile
}

enum TabIcon {
    static var search: String { return "magnifyingglass" }
    static var searchFill: String { return "magnifyingglass.circle" }
    static var experience: String { return "square.stack" }
    static var experienceFill: String { return "square.stack.fill" }
    static var profile: String { return "person" }
    static var profileFill: String { return "person.fill" }
}

class TabBar {

    static func getIcon(tab: Tab, selection: Int) -> String {
        switch tab {

        case Tab.search:
            return selection == 0 ? TabIcon.searchFill : TabIcon.search

        case Tab.experience:
            return selection == 1 ? TabIcon.experienceFill : TabIcon.experience

        case Tab.profile:
            return selection == 2 ? TabIcon.profileFill : TabIcon.profile

        }
    }
}
