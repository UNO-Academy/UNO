//
//  EmptyListCard.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/11/22.
//

import SwiftUI

struct EmptyListCard: View {

    let icon: String
    let line1: String
    let line2: String
    let textColor: Color
    let backgoundColor: Color

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: icon)
                    .font(.system(size: FontSize.title1))
                    .foregroundColor(textColor)
                Text(line1)
                    .font(.system(size: FontSize.callout))
                    .foregroundColor(textColor)
                Text(line2)
                    .font(.system(size: FontSize.callout))
                    .foregroundColor(textColor)
            }
            Spacer()
        }
        .padding(Space.cardBorder)
        .background {
            RoundedRectangle(cornerRadius: CornerRadius.defaultRadius)
                .foregroundColor(backgoundColor)
        }
    }
}

struct EmptyListCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListCard(
            icon: "flag.slash",
            line1: String(localized: "cardEmptyLivedTextLine1"),
            line2: String(localized: "cardEmptyLivedTextLine2"),
            textColor: Color.CustomColors.TitleColor,
            backgoundColor: Color.CustomColors.CardBackground
        )
    }
}
