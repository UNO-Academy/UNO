//
//  ExperiencesViewModel.swift
//  WhyNot
//
//  Created by larissa.escaliante on 08/11/22.
//

import SwiftUI

class ExperiencesViewModel: ObservableObject {
    @State var toDoExperiesces: [Experience] = []
    @State var doneExperiences: [Experience] = []

    let repository: ExperienceRepository

    init(_ repository: ExperienceRepository) {
        self.repository = repository
        loadExperiences()
    }

    func loadExperiences() {
        Task {
            let experiesces = try await repository.getActiveExperiences()
            toDoExperiesces = experiesces.toDoExperiences
            doneExperiences = experiesces.doneExperiences
        }
    }

    func getDaysLeft() -> Int? {
        guard let expirationDay = getDayFromDate(toDoExperiesces[0].expirationDate.dateValue() ?? .distantPast) else { return nil }
        guard let nowDay = getDayFromDate(Date.now) else { return nil }
        return expirationDay - nowDay
    }

    func getDayFromDate(_ date: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: date).day
    }
}
