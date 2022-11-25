//
//  StringExtensions.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 24/11/22.
//

import Foundation

// swiftlint:disable cyclomatic_complexity
extension Date {

    func convertToString() -> String {
        let calendar = Calendar.current

        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)

        return "\(String(format: "%02d", day)) \(getMonthString(month))"
    }

    private func getMonthString(_ month: Int) -> String {
        var key = ""

        switch month {
        case 1: key = "janShort"
        case 2: key = "febShort"
        case 3: key = "marShort"
        case 4: key = "aprShort"
        case 5: key = "mayShort"
        case 6: key = "junShort"
        case 7: key = "julShort"
        case 8: key = "augShort"
        case 9: key = "sepShort"
        case 10: key = "octShort"
        case 11: key = "novShort"
        case 12: key = "devShort"
        default: key = "undefined"
        }

        return String(localized: String.LocalizationValue(key))
    }

}
