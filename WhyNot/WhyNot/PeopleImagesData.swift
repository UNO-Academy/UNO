//
//  PeopleImagesData.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import Foundation
import SwiftUI

struct PeopleImageViewBiulder {

    @ViewBuilder func getPeopleImageView(image: UIImage, imageIndex: Int, totalImageNumber: Int) -> some View {
        if imageIndex <= 3 {
            return(
            AnyView(Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(Space.halfSpace)
                .background(Color.CustomColors.CardTitle)
                .clipShape(Circle())))

        }

        if imageIndex == 4 {
            return(
            AnyView(Text("+\(totalImageNumber - 4)")
                .font(.largeTitle)
                .frame(width: 100, height: 100)
                .background(.white)
                .clipShape(Circle())
                .padding(Space.halfSpace)
                .background(Color.CustomColors.CardTitle)
                .clipShape(Circle())))
        }

        return AnyView(EmptyView())
    }
}
