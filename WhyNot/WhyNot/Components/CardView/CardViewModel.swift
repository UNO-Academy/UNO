//
//  CardViewModel.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 16/11/22.
//

import SwiftUI

class CardViewModel: ObservableObject {

    @Published var experience: Experience

    var experienceType: ExperienceType {
        switch experience.category {
        case "adventure":
            return .adventure
        case "cooking":
            return .cooking
        default:
            return .explore
        }
    }

    var isActive: Bool {
        return experience.isActive
    }

    init(experience: Experience) {
        self.experience = experience
    }

    func getFillColor() -> Color {
        return experienceType.getCorrectPrimaryColor(isActive)
    }
}

