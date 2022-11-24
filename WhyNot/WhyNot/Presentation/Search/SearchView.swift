//
//  SearchView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        Text(String(localized: "searchTabLabel"))
            .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
            .foregroundColor(Color.CustomColor.cardTitle)
            .padding(Space.halfSpace)
    }
}
