//
//  CategoryIcon.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 01/11/22.
//

import SwiftUI

struct CategoryIcon: View {

    let type: ExperienceType
    let isEnable: Bool

    var body: some View {
        Image(type.rawValue)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(
                RoundedRectangle(cornerRadius: CornerRadius.defaultRadius)
                    .fill(type.getCorrectSecondaryColor(isEnable))
            )
    }
}

private struct CategoryIconPreviewHelper: View {

    @State var isEnable: Bool

    var body: some View {
        CategoryIcon(type: .adventure, isEnable: isEnable)
    }

}

struct CategoryIcon_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconPreviewHelper(isEnable: false)
    }
}

