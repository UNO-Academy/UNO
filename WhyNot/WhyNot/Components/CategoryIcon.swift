//
//  CategoryIcon.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 01/11/22.
//

import SwiftUI

struct CategoryIcon: View {

    let type: ExperienceType

    var body: some View {
        Image(type.rawValue)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(type.secondaryColor)
            )
    }
}

struct CategoryIcon_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIcon(type: .adventure)
    }
}
