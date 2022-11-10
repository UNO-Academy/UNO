//
//  PeopleImagesData.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import Foundation
import SwiftUI

class PeopleImagesViewModel: ObservableObject {
    let maxImagesNumberPossible = 4
    var images: [UIImage]
    
    init(images: [UIImage]) {
        self.images = images
    }

    func getPeopleImages() -> [UIImage] {
        var images = [UIImage]()
        for image in 0..<getActualMaxImagesNumber() {
            images.append(self.images[image])
        }
        return images
    }

    func getActualMaxImagesNumber() -> Int {
        return min(images.count, maxImagesNumberPossible)
    }

    func howManyPeopleRemains() -> Int {
        return max(images.count - maxImagesNumberPossible, 0)
    }

    func needPlusCard() -> Bool {
        return images.count > maxImagesNumberPossible
    }
}
