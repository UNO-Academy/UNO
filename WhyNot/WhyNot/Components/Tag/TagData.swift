//
//  TagData.swift
//  WhyNot
//
//  Created by Fernando Santos on 01/11/22.
//

import SwiftUI

enum TagType {

    case effort(Int), duration(Int), cost(Int)

    func getText() -> Text {
        switch self {
        case .effort(let value):
            return getEffortTextFor(value: value)
        case .duration(let value):
            return getDurationTextFor(value: value)
        case .cost(let value):
            return getCostTextFor(value: value)
        }
    }

    private func getEffortTextFor(value: Int) -> Text {
        switch value {
        case 1:
            return Text("\(TagValue.effort1.rawValue)")
        case 2:
            return Text("\(TagValue.effort2.rawValue)")
        default:
            return Text("\(TagValue.effort3.rawValue)")
        }
    }

    private func getDurationTextFor(value: Int) -> Text {
        switch value {
        case 1:
            return Text("\(TagValue.duration1.rawValue)")
        case 2:
            return Text("\(TagValue.duration2.rawValue)")
        default:
            return Text("\(TagValue.duration3.rawValue)")
        }
    }

    private func getCostTextFor(value: Int) -> Text {
        switch value {
        case 1:
            return Text("\(TagValue.cost1.rawValue)")
        case 2:
            return Text("\(TagValue.cost2.rawValue)")
        default:
            return Text("\(TagValue.cost3.rawValue)")
        }
    }

    func getImage() -> Image {
        switch self {
        case .effort:
            return Image(systemName: "stopwatch.fill")
        case .cost:
            return Image(systemName: "dollarsign.circle.fill")
        case.duration:
            return Image(systemName: "bolt.circle.fill")
        }
    }
}

enum TagValue: String {
    // TODO: quando o paulo fizer o localizable mudar isso aqui 
    case effort1 = "Easy"
    case effort2 = "Normal"
    case effort3 = "Hard"

    case duration1 = "Short"
    case duration2 = "Medium"
    case duration3 = "Long"

    case cost1 = "Cheap"
    case cost2 = "Affordable"
    case cost3 = "Expensive"

}
