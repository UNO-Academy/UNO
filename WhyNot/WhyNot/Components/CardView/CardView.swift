//
//  CardView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 03/11/22.
//

import SwiftUI
import Firebase

class CardViewModel: ObservableObject {

    @Published var experience: Experience

    init(experience: Experience) {
        self.experience = experience
    }
}

struct CardView: View {

    @ObservedObject var viewModel: CardViewModel

    var body: some View {
        HStack(spacing: Space.space1x) {
            Spacer()

            VStack(alignment: .leading) {
                Text(viewModel.experience.name)
                    .font(.system(size: 20))
                    .bold()

                TagsView(experience: viewModel.experience)

                PersonImageCollection(images: [UIImage(named: "adventure")!])
            }

            Spacer()

            CategoryIcon(
                type: .cooking,
                isEnable: viewModel.experience.isActive
            )
        }
        .aspectRatio(340 / 95, contentMode: .fit)
        .background(
            RoundedRectangle(cornerRadius: Radius.defaultRadius)
                .fill(
                    ExperienceType.cooking
                        .getCorrectPrimaryColor(viewModel.experience.isActive)
                )
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            viewModel: CardViewModel(experience: Experience(
                id: "",
                category: "Adventure Time",
                cost: 1,
                description: "",
                duration: 3,
                effort: 3,
                expirationDate: Timestamp(date: Date()),
                isActive: true,
                name: "Teste"
            ))
        )
    }
}
