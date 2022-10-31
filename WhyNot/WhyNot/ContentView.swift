//
//  ContentView.swift
//  WhyNot
//
//  Created by Fernando Santos on 26/10/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Essa contentView só extiste pra larissa não surtar")
            .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
            .foregroundColor(Color.CustomColors.CardTitle)
            .padding(Space.halfSpace)
    }
}
