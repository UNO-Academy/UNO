//
//  ExperienceCoordinator.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 28/11/22.
//

import SwiftUI

struct ExperienceCoordinator: View {

    @State private var mustGoToLoginScreen: Bool = false

    let getActiveUseCase: GetActiveExperiencesUseCase
    let likeExperienceUseCase: LikeExperienceUseCase
    let completeExperienceUseCae: CompleteExperienceUseCase

    init() {
        let userRepository = UserRepositoryImpl()
        let experienceRepository = ExperienceRepositoryImpl()

        self.getActiveUseCase = GetActiveExperiencesUseCaseImpl(
            experienceRepository: experienceRepository,
            userRepository: userRepository
        )
        self.likeExperienceUseCase = LikeExperienceUseCaseImpl(
            userRepository: userRepository
        )
        self.completeExperienceUseCae = CompleteExperienceUseCaseImpl(
            userRepository: userRepository
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                ExperiencesView(
                    mustGoToLoginScreen: $mustGoToLoginScreen,
                    getActiveUseCase: getActiveUseCase,
                    likeExperienceUseCase: likeExperienceUseCase,
                    completeExperience: completeExperienceUseCae
                )
                NavigationLink(destination: LoginView(), isActive: $mustGoToLoginScreen) { }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor(Color.CustomColor.titleColor),
                .font: UIFont(name: CustomFonts.SolidThemeFont, size: FontSize.largeTitle) ??
                    .systemFont(ofSize: FontSize.largeTitle)
            ]
            UINavigationBar.appearance().standardAppearance = appearance
        }
    }
}
