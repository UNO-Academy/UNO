//
//  ExperiencesViewModel.swift
//  WhyNot
//
//  Created by larissa.escaliante on 08/11/22.
//

import SwiftUI

class ExperiencesViewModel: ObservableObject {
    @State var activeExperiesces: [Experience] = []
    @State var livedExperiences: [Experience] = []
    
    func getDaysLeft() -> Int? {
        guard let expirationDay = getDayFromDate(activeExperiesces[0].expirationDate) else { return nil }
        guard let nowDay = getDayFromDate(Date.now) else { return nil }
        return expirationDay - nowDay
    }
    
    func getDayFromDate(_ date: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: date).day
    }
}
