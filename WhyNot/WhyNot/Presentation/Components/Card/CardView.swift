//
//  CardView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 03/11/22.
//

import SwiftUI
import Firebase

struct CardView: View {

    @ObservedObject var viewModel: CardViewModel

    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: Space.space1x
            ) {
                Text(viewModel.experience.name)
                    .font(.system(size: FontSize.title3))
                    .foregroundColor(Color.CustomColor.cardTitle)
                    .bold()

                TagCollectionView(experience: viewModel.experience)

                PersonImageCollection(images: viewModel.getPersonImages())
            }.padding([.vertical, .leading], Space.borderSpace)

            CategoryIcon(
                type: viewModel.experienceType,
                isEnable: viewModel.experience.isActive
            )
        }
        .aspectRatio(AspectRatio.cardAspectRatio, contentMode: .fit)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.defaultRadius)
                .fill(viewModel.getFillColor())
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            viewModel: CardViewModel(
                experience: Experience(
                    id: "",
                    category: "cooking",
                    cost: 2,
                    description: "",
                    duration: 2,
                    effort: 2,
                    expirationDate: Timestamp(date: Date()),
                    isActive: true,
                    name: "Teste"
                )
            )
        )
    }
}
