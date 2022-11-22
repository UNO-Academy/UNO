//
//  Colors.swift
//  WhyNot
//
//  Created by Fernando Santos on 28/10/22.
//

import SwiftUI

public extension Color {
    enum CustomColors {
        static var cardTitle: Color { return Color("CardTitleWN") }
        static var clicableColor: Color { return Color("ClicableColorWN") }
        static var daysLeft: Color { return Color("DaysLeftWN") }
        static var orangeSwipe: Color { return Color("OrangeSwipeWN") }
        static var purpleSwipe: Color { return Color("PurpleSwipeWN") }
        static var redSwipe: Color { return Color("RedSwipeWN") }
        static var titleColor: Color { return Color("TitleColor") }
        static var tabBarSymbol: Color { return Color("TabBarSymbol") }
    }

    enum PrimaryPallet {
        static var red: Color { return Color("primaryRed") }
        static var yellow: Color { return Color("primaryYellow") }
        static var green: Color { return Color("primaryGreen") }
        static var disable: Color { return Color("primaryDisable") }
    }

    enum SecondaryPallet {
        static var red: Color { return Color("secondaryRed") }
        static var yellow: Color { return Color("secondaryYellow") }
        static var green: Color { return Color("secondaryGreen") }
        static var disable: Color { return Color("secondaryDisable") }
    }
}
