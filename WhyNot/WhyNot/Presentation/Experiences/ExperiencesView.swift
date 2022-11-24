//
//  ExperiencesView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ExperiencesView: View {
    @ObservedObject var viewModel = ExperiencesViewModel(GetActiveExperiencesUseCaseImpl(
        experienceRepository: ExperienceRepositoryImpl(),
        userRepository: UserRepositoryImpl()
    ))

    var body: some View {
        VStack {
            title
                .padding(.top, Space.spaceTitleTop)
                .padding(.bottom, Space.space2x)
            activitiesSession
                .padding(.bottom, Space.space2x)
            livedSession
                .padding(.bottom, Space.space2x)
        }
        .padding(.horizontal, Space.space2x)
    }

    var title: some View {
        HStack {
            Text(String(localized: "experiencesScreenTitle"))
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
                .foregroundColor(Color.CustomColor.titleColor)
            Spacer()
        }
    }

    var activitiesSession: some View {
        VStack {
            activitiesTitle
                .padding(.bottom, Space.space1x)
            activitiesList
        }
    }

    var activitiesTitle: some View {
        HStack {
            Text(String(localized: "activitiesTableTitle"))
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title2))
                .foregroundColor(Color.CustomColor.titleColor)
            Spacer()
            Text("\(viewModel.daysLeft)")
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title2))
                .foregroundColor(Color.CustomColor.daysLeft)
                .padding(.trailing, -1)
            Text(String(localized: "daysRemainingCounter"))
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.callout))
                .foregroundColor(Color.CustomColor.daysLeft)
        }
    }

    var activitiesList: some View {
        VStack {
            if viewModel.mustShowAllDone {
                EmptyListCard(
                    icon: "flag.2.crossed.fill",
                    text: String(localized: "cardAllDoneText"),
                    textColor: Color.CustomColor.titleColorReversed,
                    backgoundColor: Color.CustomColor.daysLeft
                )
            }
            List {
                ForEach(viewModel.toDoExperiences) { experience in
                    CardView(
                        viewModel: CardViewModel(
                            experience: experience
                        )
                    )
                    .swipeActions(edge: .trailing) {
                        Button {
                            print("call done function")
                        } label: {
                            Label("doneActionLabel", systemImage: "flag.fill")
                        } .tint(Color.CustomColor.orangeSwipe)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            print("call like function")
                        } label: {
                            Label("likedActionLabel", systemImage: "heart.fill")
                        } .tint(Color.CustomColor.purpleSwipe)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .ignoresSafeArea()
                    .padding(.bottom, 10)

                }
            }
            .listStyle(.plain)
        }
    }

    var livedSession: some View {
        VStack {
            livedTitle
                .padding(.bottom, Space.space1x)
            livedList
        }
    }

    var livedTitle: some View {
        HStack {
            Text(String(localized: "experiencedTableTitle"))
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title2))
                .foregroundColor(Color.CustomColor.titleColor)
            Spacer()
        }
    }

    var livedList: some View {
        VStack {
            if viewModel.mustShowEmptyLived {
                EmptyListCard(
                    icon: "flag.slash",
                    text: String(localized: "cardEmptyLivedText"),
                    textColor: Color.CustomColor.titleColor,
                    backgoundColor: Color.CustomColor.cardBackground
                )
            } else if viewModel.mustShowSpaceLeft {
                EmptyListCard(
                    icon: "tray",
                    text: String(localized: "cardSpaceLeftText"),
                    textColor: Color.CustomColor.titleColor,
                    backgoundColor: Color.CustomColor.cardBackground
                )
            }
            ForEach(viewModel.doneExperiences) { experience in
                CardView(
                    viewModel: CardViewModel(
                        experience: experience
                    )
                )
            }
        }
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesView()
    }
}
