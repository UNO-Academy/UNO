//
//  ExperienceType.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 01/11/22.
//

import SwiftUI

enum ExperienceType: String {

    case cooking, adventure, explore

    var primaryColor: Color {
        switch self {
        case .cooking:
            return .PrimaryPallet.red
        case .adventure:
            return .PrimaryPallet.yellow
        case .explore:
            return .PrimaryPallet.green
        }
    }

    var secondaryColor: Color {
        switch self {
        case .cooking:
            return .SecondaryPallet.red
        case .adventure:
            return .SecondaryPallet.yellow
        case .explore:
            return .SecondaryPallet.green
        }
    }
}
