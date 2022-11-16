//
//  ExperiencesViewModel.swift
//  WhyNot
//
//  Created by larissa.escaliante on 08/11/22.
//

import SwiftUI

class ExperiencesViewModel: ObservableObject {
    @Published var toDoExperiesces: [Experience] = []
    @Published var doneExperiences: [Experience] = []
    @Published var daysLeft: Int = 0

    let repository: ExperienceRepository

    init(_ repository: ExperienceRepository) {
        self.repository = repository
        loadExperiences()
    }

    func loadExperiences() {
        Task {
            let experiesces = try await repository.getActiveExperiences()
            self.toDoExperiesces = experiesces.toDoExperiences
            self.doneExperiences = experiesces.doneExperiences
            self.daysLeft = getDaysLeft()
        }
    }

    func getDaysLeft() -> Int {
        let expirationDay = getExpirationDay()
        guard let nowDay = Date.now.getDay() else { return 0 }
        return expirationDay - nowDay
    }

    func getExpirationDay() -> Int {
        var date: Date = Date.now

        if !toDoExperiesces.isEmpty {
            date = toDoExperiesces[0].expirationDate.dateValue()
        } else if !doneExperiences.isEmpty {
            date = doneExperiences[0].expirationDate.dateValue()
        }

        guard let day = date.getDay() else { return 0 }
        return day
    }
}
