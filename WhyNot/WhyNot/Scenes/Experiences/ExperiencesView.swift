//
//  ExperiencesView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ExperiencesView: View {
    @EnvironmentObject var selection: URLManager

    var testes: [Testinho] = [Testinho(id: "123", nome: "A", cor: .red),
                              Testinho(id: "321", nome: "B", cor: .yellow),
                              Testinho(id: "222", nome: "C", cor: .blue),
                              Testinho(id: "333", nome: "D", cor: .green)]
    var body: some View {
        NavigationView {
            VStack {
                Text(String(localized: "experiencesScreenTitle"))
                    .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
                    .foregroundColor(Color.CustomColors.CardTitle)
                    .padding(Space.halfSpace)

                VStack {
                    ForEach(testes) { teste in
                        NavigationLink(tag: teste.id, selection: $selection.expirience) {
                            let url = selection.createDeepLink(host: URLCases.experience, id: teste.id)
                            Viewzinha(teste: teste, url: url)
                        } label: {
                            Text(teste.nome).foregroundColor(teste.cor)
                        }
                    }
                }
            }
        }
    }
}

struct Viewzinha: View {
    var teste: Testinho
    var url: URL
    var body: some View {
        ZStack {
            teste.cor.ignoresSafeArea()
            VStack {
                Text(teste.nome)
                ShareButton(url: url)
            }
        }
    }
}

struct Testinho: Identifiable {
    var id: String
    var nome: String
    var cor: Color
}
