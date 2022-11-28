//
//  TagView.swift
//  WhyNot
//
//  Created by Fernando Santos on 01/11/22.
//

import SwiftUI
import Firebase

struct TagView: View {

    let imageWidth: CGFloat = 13
    var tagData: TagType

    var body: some View {
        HStack {
            tagData.getText()
                .font(.system(size: FontSize.caption2))
                .multilineTextAlignment(.center)
            tagData.getImage()
                .resizable()
                .frame(width: imageWidth, height: imageWidth)
        }
        .foregroundColor(Color.CustomColor.cardTitle)
        .padding(Space.halfSpace)
        .background(.white)
        .cornerRadius(Space.halfSpace)
    }
}

struct TagsView: View {
    var experience: Experience

    var body: some View {
        HStack {
            TagView(tagData: TagType.effort(experience.effort))
            TagView(tagData: TagType.duration(experience.duration))
            TagView(tagData: TagType.cost(experience.cost))
            Spacer()
        }
    }
}

struct TagsViewPreview: PreviewProvider {
    static var previews: some View {
        TagsView(experience: Experience(
            category: "cooking",
            cost: 1,
            description: "lala",
            duration: 3,
            effort: 2,
            expirationDate: Timestamp(date: Date()),
            isActive: true,
            name: "Teste",
            friendsInterested: [],
            wasLiked: false
        ))
    }
}
