//
//  ProfileView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text(String(localized: "profileTabLabel"))
            .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
            .padding(Space.halfSpace)
    }
}
