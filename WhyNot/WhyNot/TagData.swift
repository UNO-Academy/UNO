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

enum TagValue: String {
    case effort1 = "Cheap"
    case effort2 = "Affordable"
    case effort3 = "Expensive"

    case duration1 = "Short"
    case duration2 = "Medium"
    case duration3 = "Long"

    case cost1 = "Easy"
    case cost2 = "Normal"
    case cost3 = "Hard"
}

struct TagData {
    var tagType: TagType

    func getTag() -> Text {
        switch tagType {
        case .effort(let value):
            let image = Image(systemName: "stopwatch.fill")
            switch value {
            case 1:
                return Text("\(TagValue.effort1.rawValue) \(image)")
            case 2:
                return Text("\(TagValue.effort2.rawValue) \(image)")
            default:
                return Text("\(TagValue.effort3.rawValue) \(image)")
            }
        case .duration(let value):
            let image = Image(systemName: "dollarsign.circle.fill")
            switch value {
            case 1:
                return Text("\(TagValue.duration1.rawValue) \(image)")
            case 2:
                return Text("\(TagValue.duration2.rawValue) \(image)")
            default:
                return Text("\(TagValue.duration3.rawValue) \(image)")
            }
        case .cost(let value):
            let image = Image(systemName: "bolt.circle.fill")
            switch value {
            case 1:
                return Text("\(TagValue.cost1.rawValue) \(image)")
            case 2:
                return Text("\(TagValue.cost2.rawValue) \(image)")
            default:
                return Text("\(TagValue.cost3.rawValue) \(image)")
            }
        }
    }
}
