//
//  PeopleImagesData.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import Foundation
import SwiftUI

class PeopleVM: ObservableObject {
    @Published var maxImagesNumberPossible = 4
    @Published var images: [UIImage]

    init(images: [UIImage]) {
        self.images = images
    }

    func getPeopleImage(index: Int) -> UIImage {
        return images[index]
    }

    func getActualMaxImagesNumber() -> Int {
        return min(images.count, maxImagesNumberPossible)
    }

    func howManyPeopleRemains() -> Int {
        return images.count - maxImagesNumberPossible
    }

    func needPlusCard() -> Bool {
        if images.count > maxImagesNumberPossible {
            return true
        } else {
            return false
        }
    }
}
