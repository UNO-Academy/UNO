//
//  ExperiencesView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct Teste: Identifiable {
    var id: Int
}

struct ExperiencesView: View {
    let weekExperiences: [Teste] = [Teste(id: 1), Teste(id: 2), Teste(id: 3), Teste(id: 4)]
    let viewModel = ExperiencesViewModel(ExperienceRepository())

    var body: some View {
        ScrollView {
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
                .foregroundColor(Color.CustomColors.TitleColor)
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
                .foregroundColor(Color.CustomColors.TitleColor)
            Spacer()
            Text("\(viewModel.daysLeft)")
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title2))
                .foregroundColor(Color.CustomColors.DaysLeft)
                .padding(.trailing, -1)
            Text(String(localized: "daysRemainingCounter"))
                .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.callout))
                .foregroundColor(Color.CustomColors.DaysLeft)
        }
    }

    var activitiesList: some View {
        VStack {
            ForEach(weekExperiences) { experience in
                Rectangle()
                    .frame(height: 100)
            }
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
                .foregroundColor(Color.CustomColors.TitleColor)
            Spacer()
        }
    }

    var livedList: some View {
        VStack {
            ForEach(weekExperiences) { experience in
                Rectangle()
                    .frame(height: 100)
            }
        }
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesView()
    }
}
