//
//  ExpandedTagView.swift
//  WhyNot
//
//  Created by Paulo Bassani on 30/11/22.
//

import SwiftUI
import Firebase

struct ExpandedTagView: View {
    @Environment(\.colorScheme) var colorScheme
    var tagData: TagType

    var body: some View {
        VStack {
            tagData.getTitle()
                .font(.system(size: FontSize.caption1))
                .foregroundColor(Color(uiColor: .systemGray))
            tagData.getImage()
                .font(.system(size: FontSize.caption1))
                .foregroundColor(Color(colorScheme == .dark ? .white : .black))
            tagData.getText()
                .font(.system(size: FontSize.caption1, weight: .semibold))
                .foregroundColor(Color(colorScheme == .dark ? .white : .black))
                .multilineTextAlignment(.center)
        }
        .frame(width: Space.space8x)
    }
}

struct ExpandedTagCollectionView: View {
    var experience: Experience

    var body: some View {
        VStack {
            Divider()
                .frame(height: Space.stroke)
                .overlay(Color(uiColor: .systemGray2))
            HStack {
                Spacer()
                ExpandedTagView(tagData: TagType.duration(experience.duration))
                SpacedDivider()
                ExpandedTagView(tagData: TagType.cost(experience.cost))
                SpacedDivider()
                ExpandedTagView(tagData: TagType.effort(experience.effort))
                Spacer()
            }
            .frame(height: Space.space4x)
            Divider()
                .frame(height: Space.stroke)
                .overlay(Color(uiColor: .systemGray2))
        }
    }
}

struct SpacedDivider: View {
    var body: some View {
        Spacer()
        Divider()
            .frame(width: Space.stroke)
            .overlay(Color(uiColor: .systemGray2))
        Spacer()
    }
}

struct ExpandedTagsViewPreview: PreviewProvider {
    static var previews: some View {
        ExpandedTagCollectionView(experience: Experience(
            category: "cooking",
            cost: 1,
            description: "lala",
            duration: 1,
            effort: 1,
            expirationDate: Timestamp(date: Date()),
            isActive: true,
            name: "Teste"
        ))
    }
}
