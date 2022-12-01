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
                .padding(Space.stroke)
            tagData.getText()
                .font(.system(size: FontSize.caption1, weight: .semibold))
                .foregroundColor(Color(colorScheme == .dark ? .white : .black))
                .multilineTextAlignment(.center)
        }
    }
}

struct ExpandedTagsView: View {
    var experience: Experience
    let expandedTagsHeight: CGFloat = 56

    var body: some View {
        VStack {
            Divider()
                .frame(height: Space.stroke)
                .overlay(Color(uiColor: .systemGray2))
            HStack {
                Spacer()
                ExpandedTagView(tagData: TagType.duration(experience.duration))
                Group {
                    Spacer()
                    Divider()
                        .frame(width: Space.stroke)
                        .overlay(Color(uiColor: .systemGray2))
                    Spacer()
                }
                ExpandedTagView(tagData: TagType.cost(experience.cost))
                Group {
                    Spacer()
                    Divider()
                        .frame(width: Space.stroke)
                        .overlay(Color(uiColor: .systemGray2))
                    Spacer()
                }
                ExpandedTagView(tagData: TagType.effort(experience.effort))
                Spacer()
            }
            .frame(height: expandedTagsHeight)
            Divider()
                .frame(height: Space.stroke)
                .overlay(Color(uiColor: .systemGray2))
        }
    }
}

struct ExpandedTagsViewPreview: PreviewProvider {
    static var previews: some View {
        ExpandedTagsView(experience: Experience(
            category: "cooking",
            cost: 1,
            description: "lala",
            duration: 1,
            effort: 1,
            expirationDate: Timestamp(date: Date()),
            isActive: true,
            name: "Teste"
        ))
        .background(Color(.black))
    }
}
