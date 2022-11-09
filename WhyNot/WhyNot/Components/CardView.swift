//
//  CardView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 03/11/22.
//

import SwiftUI

struct CardView: View {

    let experience: Experience
    @State var isEnable = true

    var body: some View {
        HStack(spacing: Space.space1x) {
            VStack {
                Text(experience.name)
                    .font(.system(size: 20))
                    .bold()

                LazyHStack(alignment: .center) {
                    TagView(
                        tagData: .duration(experience.duration)
                    )

                    TagView(
                        tagData: .cost(experience.cost)
                    )

                    TagView(
                        tagData: .effort(experience.effort)
                    )
                }
            }

            CategoryIcon(
                type: .cooking,
                isEnable: $isEnable
            )
        }.background(
            RoundedRectangle(cornerRadius: Radius.defaultRadius)
                .fill(isEnable ? ExperienceType.cooking.primaryColor : Color.SecondaryPallet.disable)
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            experience: Experience(
                id: "",
                name: "Adventure Time",
                description: "",
                effort: 2,
                duration: 3,
                cost: 2,
                category: "",
                isActive: true
            )
        )
    }
}
