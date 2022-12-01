//
//  ExperiencesView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ExperiencesView: View {
    @Binding var mustGoToLoginScreen: Bool
    @ObservedObject var viewModel: ExperiencesViewModel

    init(mustGoToLoginScreen: Binding<Bool>) {
        self._mustGoToLoginScreen = mustGoToLoginScreen
        let userRepository = UserRepositoryImpl()
        viewModel = ExperiencesViewModel(
            getActiveUseCase: GetActiveExperiencesUseCaseImpl(
                experienceRepository: ExperienceRepositoryImpl(),
                userRepository: userRepository
            ),
            likeExperienceUseCase: LikeExperienceUseCaseImpl(userRepository: userRepository)
        )
    }

    var body: some View {
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
        .listStyle(.plain)
        .padding(.horizontal, Space.space2x)
        .navigationBarTitle(Text(String(localized: "experiencesScreenTitle")), displayMode: .large)
        .alert(
            String(localized: "userNotLoggedAlertTitle"),
            isPresented: $viewModel.mustShowUserNotLoggedAlert
        ) {
            Button(String(localized: "LoginAlertButton")) {
                self.mustGoToLoginScreen = true
            }
            Button(String(localized: "LaterAlertButton"), role: .cancel) { }
        }
    }

    var topScreen: some View {
        VStack {
            activitiesTitle
                .padding(.bottom, Space.space1x)
            if viewModel.mustShowAllDone {
                EmptyListCard(
                    icon: "flag.2.crossed.fill",
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
            CardView(
                viewModel: CardViewModel(
                    experience: experience
                )
            )
            .swipeActions(edge: .leading) {
                Button {
                    viewModel.likeExperience(experience)
                } label: {
                    Label("likedActionLabel", systemImage: "heart.fill")
                } .tint(Color.CustomColor.purpleSwipe)
            }
            .swipeActions(edge: .trailing) {
                Button {
                    print("call done function")
                } label: {
                    Label("doneActionLabel", systemImage: "flag.fill")
                } .tint(Color.CustomColor.orangeSwipe)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .ignoresSafeArea()
            .padding(.bottom, Space.space1x)
        }
    }

    var topLeaved: some View {
        VStack {
            livedTitle
                .padding(.bottom, Space.space1x)
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
            CardView(
                viewModel: CardViewModel(
                    experience: experience
                )
            )
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .ignoresSafeArea()
        }
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    @State private var mustGoToLoginScreen: Bool = false

    static var previews: some View {
        ExperiencesView(mustGoToLoginScreen: .constant(false))
    }
}
