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
        NavigationView {
            List {
                topScreen
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .ignoresSafeArea()
                activitiesList
                topLeaved
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .ignoresSafeArea()
                    .padding(.bottom, Space.space1x)
                    .padding(.top, Space.space1x)
                livedList
                    .padding(.bottom, Space.space2x)
            }
            .listStyle(GroupedListStyle())
            .padding(.horizontal, Space.space2x)
            .navigationBarTitle(Text(String(localized: "experiencesScreenTitle")), displayMode: .large)
        }
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor(Color.CustomColor.titleColor),
                .font: UIFont(name: CustomFonts.SolidThemeFont, size: FontSize.largeTitle)!
            ]

            UINavigationBar.appearance().standardAppearance = appearance
            UITableView.appearance().sectionHeaderHeight = Space.none
            UITableView.appearance().showsVerticalScrollIndicator = false
        }
    }

    var topScreen: some View {
        VStack {
            activitiesTitle
            if viewModel.mustShowAllDone {
                EmptyListCard(
                    icon: Icons.flag2CrossedFill,
                    text: String(localized: "cardAllDoneText"),
                    textColor: Color.CustomColor.titleColorReversed,
                    backgoundColor: Color.CustomColor.daysLeft
                )
            }
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
        ForEach(viewModel.toDoExperiences) { experience in
            Section {
                CardView(
                    viewModel: CardViewModel(
                        experience: experience
                )
            )
            // TODO: remove navegation mcgavier fix when implementing correction in title page
            .overlay(
                NavigationLink(
                destination: ExperiencesDetailsView(
                viewModel: ExperienceDetailsViewModel(experience: experience)
                ), label: {})
                // fixedSize remove arrow indicator from navLink
                .fixedSize()
            )
            .swipeActions(edge: .leading) {
                Button {
                    print("call like function")
                } label: {
                    Label("likedActionLabel", systemImage: Icons.heartFill)
                } .tint(Color.CustomColor.purpleSwipe)
            }
            .swipeActions(edge: .trailing) {
                Button {
                    print("call done function")
                } label: {
                    Label("doneActionLabel", systemImage: Icons.flagFill)
                } .tint(Color.CustomColor.orangeSwipe)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .ignoresSafeArea()
            }
        }
    }

    var topLeaved: some View {
        VStack {
            livedTitle
                .padding(.bottom, Space.space1x)
            if viewModel.mustShowEmptyLived {
                EmptyListCard(
                    icon: Icons.flagSlash,
                    text: String(localized: "cardEmptyLivedText"),
                    textColor: Color.CustomColor.titleColor,
                    backgoundColor: Color.CustomColor.cardBackground
                )
            } else if viewModel.mustShowSpaceLeft {
                EmptyListCard(
                    icon: Icons.tray,
                    text: String(localized: "cardSpaceLeftText"),
                    textColor: Color.CustomColor.titleColor,
                    backgoundColor: Color.CustomColor.cardBackground
                )
            }
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
        ForEach(viewModel.doneExperiences) { experience in
            Section {
                CardView(
                    viewModel: CardViewModel(
                        experience: experience
                    )
                )
                .overlay(NavigationLink(
                    destination: ExperiencesDetailsView(
                    viewModel: ExperienceDetailsViewModel(experience: experience)

                    ), label: {})
                )
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .ignoresSafeArea()
        }
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesView()
    }
}
