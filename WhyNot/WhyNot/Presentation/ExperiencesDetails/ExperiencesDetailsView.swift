//
//  ExperiencesDetailsView.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 14/11/22.
//

import SwiftUI

enum ExperiencesDetailsConstants {
    static let safetySpace: CGFloat = 36
    static let iconBtnSize: CGFloat = 22
    static let disclaimIconSize: CGFloat = 15
    static let categoryIconWidth: CGFloat = 224
    static let seeLikesKey: LocalizedStringKey = "seeLikesButton"
    static let tipTitleKey: LocalizedStringKey = "tipTitle"
}

struct ExperiencesDetailsView: View {
    @ObservedObject var viewModel: ExperienceDetailsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            titleView
            iconLargeView
            if !viewModel.usersLikes.isEmpty { likesView }
            descriptionView
            if !viewModel.experienceDisclaim.isEmpty { disclaimView }
            doneBtnView
            if !viewModel.experienceTip.isEmpty { tipsView }

            Spacer()
        }
        .padding([.leading, .trailing], ExperiencesDetailsConstants.safetySpace)
        .navigationBarTitleDisplayMode(.inline)
    }

    var titleView: some View {
        Group {
            HStack {
                LikeBtnView(viewModel: LikeBtnViewModel(isLiked: viewModel.isLiked))
                    .font(.system(size: ExperiencesDetailsConstants.iconBtnSize))

                Spacer()

                Text(viewModel.experienceTitle)
                    .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title3))

                Spacer()

                // TODO: Remove this button mock and add shareButton component here
                Button {
                } label: {
                    Image(systemName: Icons.squareAndArrowUp)
                }
                .font(.system(size: ExperiencesDetailsConstants.iconBtnSize))
                .foregroundColor(Color.CustomColor.clicableColor)
            }

            Spacer().frame( height: Space.space2x)
        }
    }

    var iconLargeView: some View {
        Group {
            HStack {
                Spacer()

                CategoryIcon(type: viewModel.experienceType, isEnable: viewModel.isExperienceIconEnabled)
                    .frame(width: ExperiencesDetailsConstants.categoryIconWidth)

                Spacer()
            }

            Spacer().frame( height: Space.space2x)
        }

    }

    var likesView: some View {
        HStack {
            PersonImageCollection(images: viewModel.getPersonImages())

            Spacer()

            Button {
                // TODO: Add open modal here
            } label: {
                Text(ExperiencesDetailsConstants.seeLikesKey)
            }
        }
    }

    var descriptionView: some View {
        Group {
            Spacer().frame(height: Space.space1x)

            Text(viewModel.experienceDescription)
                .font(.callout)
                .multilineTextAlignment(.leading)

            Spacer().frame( height: Space.halfSpace)
        }
    }

    var disclaimView: some View {
        HStack {
            Image(systemName: Icons.exclamationmarkTriangle)
                .font(.system(size: ExperiencesDetailsConstants.disclaimIconSize))

            Spacer().frame( width: Space.halfSpace)

            Text(viewModel.experienceDisclaim)
                .font(.caption2)
                .multilineTextAlignment(.leading)
        }
        .foregroundColor(Color.red)
    }

    var doneBtnView: some View {
        Group {
            Spacer().frame( height: Space.space2x)

            DoneBtnView(viewModel: DoneBtnViewModel(
                experienceTitle: $viewModel.experienceTitle,
                isExperienceDone: $viewModel.isExperienceDone)
            )
        }
    }

    var tipsView: some View {
        Group {
            Spacer().frame( height: Space.space2x)

            Text(ExperiencesDetailsConstants.tipTitleKey)
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title2))

            Spacer().frame(height: Space.space1x)

            Text(viewModel.experienceTip)
                .font(.callout)
                .multilineTextAlignment(.leading)
        }
    }
}
