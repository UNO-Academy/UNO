//
//  ExperiencesViewModel.swift
//  WhyNot
//
//  Created by larissa.escaliante on 08/11/22.
//

import SwiftUI

class ExperiencesViewModel: ObservableObject {

    @Published var toDoExperiences: [Experience] = []
    @Published var doneExperiences: [Experience] = []

    @Published var daysLeft: Int = 0

    @Published var mustShowEmptyLived: Bool = false
    @Published var mustShowSpaceLeft: Bool = false
    @Published var mustShowAllDone: Bool = false

    let repository: ExperienceRepository

    init(_ repository: ExperienceRepository, completion: @escaping (() -> Void) = {}) {
        self.repository = repository
        loadExperiences(completion)
    }

    func loadExperiences(_ completion: @escaping () -> Void) {
        Task {
            let experiences = try await repository.getActiveExperiences()

            DispatchQueue.main.async {
                self.toDoExperiences = experiences.toDoExperiences
                self.doneExperiences = experiences.doneExperiences

                self.daysLeft = self.getDaysLeft()

                self.mustShowEmptyLived = self.doneExperiences.isEmpty
                self.mustShowSpaceLeft = !self.doneExperiences.isEmpty && !self.toDoExperiences.isEmpty
                self.mustShowAllDone = self.toDoExperiences.isEmpty

                completion()
            }
        }
    }

    func getDaysLeft() -> Int {
        let expirationDay = getExpirationDay()
        guard let nowDay = Date.now.getDay() else { return 0 }
        let left = expirationDay - nowDay
        return left >= 0 ? left : 0
    }

    func getExpirationDay() -> Int {
        var date: Date = Date.now

        if !toDoExperiences.isEmpty {
            date = toDoExperiences[0].expirationDate.dateValue()
        } else if !doneExperiences.isEmpty {
            date = doneExperiences[0].expirationDate.dateValue()
        }

        guard let day = date.getDay() else { return 0 }
        return day
    }
}
