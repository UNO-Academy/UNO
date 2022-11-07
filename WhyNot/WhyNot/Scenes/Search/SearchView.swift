//
//  SearchView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        Text("Pesquisar")
            .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
            .foregroundColor(Color.CustomColors.CardTitle)
            .padding(Space.halfSpace)
    }
}
