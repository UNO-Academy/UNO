//
//  TagData.swift
//  WhyNot
//
//  Created by Fernando Santos on 01/11/22.
//

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
