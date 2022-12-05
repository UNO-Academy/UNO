//
//  ExperienceDetailsViewModel.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 25/11/22.
//

import SwiftUI

class ExperienceDetailsViewModel: ObservableObject {
    var experience: Experience

    @Published var experienceType: ExperienceType
    @Published var isExperienceDone: Bool
    @Published var isLiked: Bool
    var isExperienceIconEnabled: Bool { !isExperienceDone }
    var showDisclaim: Bool { false }
    var showTips: Bool { false }
    var showLikes: Bool { experience.friendsInterested?.isEmpty == false }

    init(experience: Experience) {
        // TODO: add some props in firebase table
        self.experience = experience
        experienceType = ExperienceType(rawValue: experience.category) ?? .adventure
        isExperienceDone = !experience.isActive
        isLiked = false
    }

    func getPersonImages() -> [UIImage] {
        guard let friendsInterested = experience.friendsInterested else { return [] }
        return friendsInterested.compactMap {
            guard let data = $0.profilePicture else { return nil }
            return UIImage(data: data)
        }
    }
}
