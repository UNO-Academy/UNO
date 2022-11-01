//
//  ContentView.swift
//  WhyNot
//
//  Created by Fernando Santos on 26/10/22.
//

import Foundation
import SwiftUI

enum TagType {
    case effort(Int), duration(Int), cost(Int)
}

struct TagData {
    var tagType: TagType

    func getTag() -> Text {
        switch tagType {
        case .effort(let int):
            let image = Image(systemName: "stopwatch.fill")
            switch int {
            case 1:
                return Text("\("Cheap") \(image)")
            case 2:
                return Text("\("Affordable") \(image)")
            default:
                return Text("\("Expensive") \(image)")
            }
        case .duration(let int):
            let image = Image(systemName: "dollarsign.circle.fill")
            switch int {
            case 1:
                return Text("\("Short") \(image)")
            case 2:
                return Text("\("Medium") \(image)")
            default:
                return Text("\("Long") \(image)")
            }
        case .cost(let int):
            let image = Image(systemName: "bolt.circle.fill")
            switch int {
            case 1:
                return Text("\("Easy") \(image)")
            case 2:
                return Text("\("Normal") \(image)")
            default:
                return Text("\("Hard") \(image)")
            }
        }
    }
}

struct TagView: View {
    var tagData: TagData

    var body: some View {
        tagData.getTag()
            .padding(8)
            .background(.yellow)
            .cornerRadius(8)
    }
}


struct TagsView: View {
    var expirience: Experience

    var body: some View {
        VStack {
            HStack {
                TagView(tagData: TagData(tagType: TagType.effort(expirience.effort)))
                TagView(tagData: TagData(tagType: TagType.duration(expirience.duration)))
                TagView(tagData: TagData(tagType: TagType.cost(expirience.cost)))
            }
        }
    }
}

struct Experience_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(expirience: Experience(id: "aaa",
                    name: "Adventure Time",
                       description: "",
                       effort: 2,
                       duration: 2,
                       cost: 1,
                       category: "a",
                       isActive: false))
struct ContentView: View {
    var body: some View {
        Text("Essa contentView só extiste pra larissa não surtar")
            .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.largeTitle))
            .foregroundColor(Color.CustomColors.CardTitle)
            .padding(Space.halfSpace)
    }
}
