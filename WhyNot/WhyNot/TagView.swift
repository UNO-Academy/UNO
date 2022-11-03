//
//  TagView.swift
//  WhyNot
//
//  Created by Fernando Santos on 01/11/22.
//

import SwiftUI

struct TagView: View {
    var tagData: TagData

    var body: some View {
        tagData.getTag()
            .foregroundColor(Color.CustomColors.CardTitle)
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
                TagView(tagData: TagData(tagType: TagType.effort(experience.effort)))
                TagView(tagData: TagData(tagType: TagType.duration(experience.duration)))
                TagView(tagData: TagData(tagType: TagType.cost(experience.cost)))
            }
        }
    }
}
