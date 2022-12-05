//
//  TabBar.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 01/11/22.
//

import SwiftUI

struct TabBarView: View {

    @State var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            SearchView()
                .tabItem {
                    TabItem(tab: Tab.search)
                }.tag(0)
            ExperienceCoordinator()
                .tabItem {
                    TabItem(tab: Tab.experience)
                }.tag(1)
            ProfileView()
                .tabItem {
                    TabItem(tab: Tab.profile)
                }.tag(2)
        }.accentColor(Color.CustomColor.clicableColor)
    }
}

struct TabItem: View {

    let tab: Tab

    var body: some View {
        tab.getIcon()
            .renderingMode(.template)
            .environment(\.symbolVariants, .none)
        Text(tab.getName())
    }
}
