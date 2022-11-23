//
//  PeopleImagesView.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import SwiftUI

enum PeopleConstants: CGFloat {
    case ratio = 21
    case fontSize = 10
}

struct PersonImageCollection: View {
    
    @ObservedObject var viewModel: PersonImageViewModel

    init(images: [UIImage]) {
        viewModel = PersonImageViewModel(images: images)
    }

    var body: some View {
        HStack(spacing: -Space.halfSpace) {
            ForEach(viewModel.getPeopleImages(), id: \.self) { image in
                PersonImage(ratio: PeopleConstants.ratio.rawValue, personImage: Image(uiImage: image))
            }

            if viewModel.needPlusCard() {
                let remainingPeople = viewModel.howManyPeopleRemains()
                RemainingPeople(
                    ratio: PeopleConstants.ratio.rawValue,
                    fontSize: PeopleConstants.fontSize.rawValue,
                    remainingPeopleNumber: remainingPeople
                )
            }
        }
    }
}
