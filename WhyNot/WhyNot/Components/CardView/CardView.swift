//
//  CardView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 03/11/22.
//

import SwiftUI

class CardViewModel: ObservableObject {

    @Published var isEnable = false
    @Published var experience: Experience

    init(
        isEnable: Bool = false,
        experience: Experience
    ) {
        self.isEnable = isEnable
        self.experience = experience
    }
}

struct CardView: View {

    @ObservedObject var viewModel: CardViewModel

    var body: some View {
        HStack(spacing: Space.space1x) {
            Spacer()

            VStack {
                Text(viewModel.experience.name)
                    .font(.system(size: 20))
                    .bold()

                TagsView(experience: viewModel.experience)
            }

            Spacer()

            CategoryIcon(
                type: .cooking,
                isEnable: $viewModel.isEnable
            )
        }.background(
            RoundedRectangle(cornerRadius: Radius.defaultRadius)
                .fill(
                    viewModel.isEnable ? ExperienceType.cooking.primaryColor : Color.SecondaryPallet.disable
                )
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            viewModel: CardViewModel(experience: Experience(
                id: "",
                name: "Adventure Time",
                description: "",
                effort: 2,
                duration: 3,
                cost: 2,
                category: "",
                isActive: true
            ))
        )
    }
}
