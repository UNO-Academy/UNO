//
//  ContentView.swift
//  WhyNot
//
//  Created by Fernando Santos on 26/10/22.
//

import Foundation
import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            // TODO: colocar aas labels nos localizables
            ExperiencesView()
                .tabItem {
                    Label("Pesquisar", systemImage: "magnifyingglass")
                }

            ExperiencesView()
                .tabItem {
                    Label("Experiências", systemImage: "square.stack")
                }
            ExperiencesView()
                .tabItem {
                    Label("Perfil", systemImage: "person")
                }
        } .accentColor(.orange)
    }
}
