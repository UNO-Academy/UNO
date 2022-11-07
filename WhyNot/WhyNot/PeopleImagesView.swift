//
//  PeopleImagesView.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import SwiftUI

struct PeopleImagesView: View {
    var images: [UIImage]
    let imageBiulder = PeopleImageViewBiulder()

    var body: some View {
        HStack(spacing: -Space.space8x) {
            ForEach(0..<images.count) { imageIdx in
                imageBiulder.getPeopleImageView(image: images[imageIdx], imageIndex: imageIdx, totalImageNumber: images.count)
            }
        }
    }
}
