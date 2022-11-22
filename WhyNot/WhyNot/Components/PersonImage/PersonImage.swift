//
//  ImgagePeopleUiElement.swift
//  WhyNot
//
//  Created by Fernando Santos on 08/11/22.
//

import SwiftUI

struct PersonImage: View {
    let ratio: CGFloat
    var personImage: Image

    var body: some View {
        personImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: ratio, height: ratio)
            .clipShape(Circle())
    }
}

struct RemainingPeople: View {
    let ratio: CGFloat
    let fontSize: CGFloat
    var remainingPeopleNumber: Int

    var body: some View {
        Text("+\(remainingPeopleNumber)")
            .font(.system(size: fontSize))
            .frame(width: ratio, height: ratio)
            .background(.white)
            .clipShape(Circle())
    }
}
