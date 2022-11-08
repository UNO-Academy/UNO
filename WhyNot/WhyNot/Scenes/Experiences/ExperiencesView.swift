//
//  ExperiencesView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ExperiencesView: View {
    var body: some View {
        Text(String(localized: "experiencesScreenTitle"))
            .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
            .foregroundColor(Color.CustomColors.CardTitle)
            .padding(Space.halfSpace)
    }
}
