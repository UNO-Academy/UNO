//
//  PeopleImagesData.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import Foundation
import SwiftUI

enum ViewBiulderConstants: Int {
    case ratio = 21
    case maxImages = 4
}

struct PeopleImageViewBiulder {

    @ViewBuilder func getPeopleImageView(image: UIImage, imageIndex: Int, totalImageNumber: Int) -> some View {
        if imageIndex < ViewBiulderConstants.maxImages.rawValue {
            return(
            AnyView(Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: CGFloat(ViewBiulderConstants.ratio.rawValue), height: CGFloat(ViewBiulderConstants.ratio.rawValue))
                .clipShape(Circle())
                .padding(Space.halfSpace)
                .background(Color.CustomColors.CardTitle)
                .clipShape(Circle())))
        }

        if imageIndex == ViewBiulderConstants.maxImages.rawValue {
            return(
            AnyView(Text("+\(totalImageNumber - ViewBiulderConstants.maxImages.rawValue)")
                .font(.largeTitle)
                .frame(width: CGFloat(ViewBiulderConstants.ratio.rawValue), height: CGFloat(ViewBiulderConstants.ratio.rawValue))
                .background(.white)
                .clipShape(Circle())
                .padding(Space.halfSpace)
                .background(Color.CustomColors.CardTitle)
                .clipShape(Circle())))
        }

        return AnyView(EmptyView())
    }
}
