//
//  ContentView.swift
//  WhyNot
//
//  Created by Fernando Santos on 26/10/22.
//

import Foundation
import SwiftUI

struct ContentView: View {

    @State var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            // TODO: colocar aas labels nos localizables
            SearchView()
                .tabItem {
                    Label(
                        "Pesquisar",
                        systemImage: TabBar.getIcon(tab: Tab.search, selection: selection)
                    )
                }.tag(0)
            ExperiencesView()
                .tabItem {
                    Label(
                        "Experiências",
                        systemImage: TabBar.getIcon(tab: Tab.experience, selection: selection)
                    )
                }.tag(1)
            ProfileView()
                .tabItem {
                    Label(
                        "Perfil",
                        systemImage: TabBar.getIcon(tab: Tab.profile, selection: selection)
                    )
                }.tag(2)
        } .accentColor(Color.CustomColors.ClicableColor)
    }
}
