//
//  PeopleImagesView.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import SwiftUI

struct PeopleImagesView: View {
    @ObservedObject var viewModel: PeopleVM

    init(images: [UIImage]) {
        viewModel = PeopleVM(images: images)
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
