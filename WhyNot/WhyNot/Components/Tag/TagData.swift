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
            switch value {
            case 1:
                return Text("\(TagValue.effort1.rawValue)")
            case 2:
                return Text("\(TagValue.effort2.rawValue)")
            default:
                return Text("\(TagValue.effort3.rawValue)")
            }
        case .duration(let value):
            switch value {
            case 1:
                return Text("\(TagValue.duration1.rawValue)")
            case 2:
                return Text("\(TagValue.duration2.rawValue)")
            default:
                return Text("\(TagValue.duration3.rawValue)")
            }
        case .cost(let value):
            switch value {
            case 1:
                return Text("\(TagValue.cost1.rawValue)")
            case 2:
                return Text("\(TagValue.cost2.rawValue)")
            default:
                return Text("\(TagValue.cost3.rawValue)")
            }
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
