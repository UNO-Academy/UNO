//
//  ExperienceDetailsViewModel.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 25/11/22.
//

import SwiftUI

class ExperienceDetailsViewModel: ObservableObject {
    var experience: Experience

    @Published var experienceTitle: String
    @Published var experienceDescription: String
    @Published var experienceDisclaim: String
    @Published var experienceTip: String
    @Published var experienceType: ExperienceType
    @Published var isExperienceDone: Bool
    @Published var isLiked: Bool
    var usersLikes: [UIImage] {getPersonImages()}
    var isExperienceIconEnabled: Bool {!isExperienceDone}

    init(experience: Experience) {
        // TODO: add some props in firebase table
        print(experience.category)
        self.experience = experience
        experienceTitle = experience.name
        experienceDescription = experience.description
        experienceDisclaim = ""
        experienceTip = ""
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
