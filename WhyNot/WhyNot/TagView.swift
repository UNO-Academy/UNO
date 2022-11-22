//
//  TagView.swift
//  WhyNot
//
//  Created by Fernando Santos on 01/11/22.
//

import SwiftUI

struct TagView: View {
    var tagData: TagType

    var body: some View {
        HStack {
            tagData.getText()
            tagData.getImage()
        }.foregroundColor(Color.CustomColors.cardTitle)
            .padding(Space.halfSpace)
            .background(.white)
            .cornerRadius(Space.halfSpace)
    }
}

struct TagsView: View {
    var experience: Experience

    var body: some View {
        VStack {
            HStack {
                TagView(tagData: TagType.effort(experience.effort))
                TagView(tagData: TagType.duration(experience.duration))
                TagView(tagData: TagType.cost(experience.cost))
            }
        }
    }
}
