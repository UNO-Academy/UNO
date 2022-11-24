//
//  EmptyListCard.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/11/22.
//

import SwiftUI

struct EmptyListCard: View {

    let icon: String
    let text: String
    let textColor: Color
    let backgoundColor: Color

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: icon)
                    .font(.system(size: FontSize.title1))
                    .foregroundColor(textColor)
                Text(text)
                    .font(.system(size: FontSize.callout))
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.center)
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
            text: String(localized: "cardEmptyLivedTextLine"),
            textColor: Color.CustomColor.titleColor,
            backgoundColor: Color.CustomColor.cardBackground
        )
    }
}
