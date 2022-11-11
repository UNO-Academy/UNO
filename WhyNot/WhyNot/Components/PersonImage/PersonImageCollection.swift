//
//  PeopleImagesView.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import SwiftUI

struct PersonImageCollection: View {
    @ObservedObject var viewModel: PersonImageViewModel

    init(images: [UIImage]) {
        viewModel = PersonImageViewModel(images: images)
    }

    var body: some View {
        HStack(spacing: -Space.halfSpace) {
            ForEach(viewModel.getPeopleImages(), id: \.self) { image in
                PersonImage(personImage: Image(uiImage: image))
            }
            
            if viewModel.needPlusCard() {
                let remainingPeople = viewModel.howManyPeopleRemains()
                RemainingPeople(remainingPeopleNumber: remainingPeople)
            }
        }
    }
}
