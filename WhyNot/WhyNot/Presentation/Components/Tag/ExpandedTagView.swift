//
//  ExpandedTagView.swift
//  WhyNot
//
//  Created by Paulo Bassani on 30/11/22.
//

import SwiftUI
import Firebase

struct ExpandedTagView: View {

    var tagData: TagType

    var body: some View {
        VStack {
            tagData.getTitle()
                .font(.system(size: FontSize.caption1))
                .foregroundColor(Color(uiColor: .systemGray))
            tagData.getImage()
                .font(.system(size: FontSize.caption1))
                .foregroundColor(Color(.white))
            tagData.getText()
                .font(.system(size: FontSize.caption1, weight: .semibold))
                .foregroundColor(Color(.white))
                .multilineTextAlignment(.center)
        }
    }
}

struct ExpandedTagsView: View {
    var experience: Experience

    var body: some View {
        HStack {
            Spacer()
            ExpandedTagView(tagData: TagType.duration(experience.duration))
            Spacer()
            ExpandedTagView(tagData: TagType.cost(experience.cost))
            Spacer()
            ExpandedTagView(tagData: TagType.effort(experience.effort))
            Spacer()
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
