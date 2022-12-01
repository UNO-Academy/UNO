//
//  ExperienceCoordinator.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 28/11/22.
//

import SwiftUI

struct ExperienceCoordinator: View {
    @State private var mustGoToLoginScreen: Bool = false

    var body: some View {
        NavigationView {
            NavigationLink(destination: LoginView(), isActive: $mustGoToLoginScreen) {
                ExperiencesView(mustGoToLoginScreen: $mustGoToLoginScreen)
            }
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
}
