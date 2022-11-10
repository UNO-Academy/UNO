//
//  ImgagePeopleUiElement.swift
//  WhyNot
//
//  Created by Fernando Santos on 08/11/22.
//

import SwiftUI

enum PeopleConstants: CGFloat {
    case ratio = 21
    case fontSize = 10
}

struct PersonImage: View {
    var personImage: Image

    var body: some View {
        personImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: PeopleConstants.ratio.rawValue, height: PeopleConstants.ratio.rawValue)
            .clipShape(Circle())
    }
}

struct RemainingPeople: View {
    var remainingPeopleNumber: Int

    var body: some View {
        Text("+\(remainingPeopleNumber)")
            .font(.system(size: PeopleConstants.fontSize.rawValue))
            .frame(width: PeopleConstants.ratio.rawValue, height: PeopleConstants.ratio.rawValue)
            .background(.white)
            .clipShape(Circle())
    }
}
