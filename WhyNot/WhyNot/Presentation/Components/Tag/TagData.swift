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
            return Text(NSLocalizedString(TagValue.effort1.rawValue, comment: ""))
        case 2:
            return Text(NSLocalizedString(TagValue.effort2.rawValue, comment: ""))
        case 3:
            return Text(NSLocalizedString(TagValue.effort3.rawValue, comment: ""))
        default:
            return Text("-")
        }
    }

    private func getDurationTextFor(value: Int) -> Text {
        switch value {
        case 1:
            return Text(NSLocalizedString(TagValue.duration1.rawValue, comment: ""))
        case 2:
            return Text(NSLocalizedString(TagValue.duration2.rawValue, comment: ""))
        case 3:
            return Text(NSLocalizedString(TagValue.duration3.rawValue, comment: ""))
        default:
            return Text("-")
        }
    }

    private func getCostTextFor(value: Int) -> Text {
        switch value {
        case 1:
            return Text(NSLocalizedString(TagValue.cost1.rawValue, comment: ""))
        case 2:
            return Text(NSLocalizedString(TagValue.cost2.rawValue, comment: ""))
        case 3:
            return Text(NSLocalizedString(TagValue.cost3.rawValue, comment: ""))
        default:
            return Text("-")
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
    case effort1 = "effort1Tag"
    case effort2 = "effort2Tag"
    case effort3 = "effort3Tag"

    case duration1 = "duration1Tag"
    case duration2 = "duration2Tag"
    case duration3 = "duration3Tag"

    case cost1 = "cost1Tag"
    case cost2 = "cost2Tag"
    case cost3 = "cost3Tag"

}
