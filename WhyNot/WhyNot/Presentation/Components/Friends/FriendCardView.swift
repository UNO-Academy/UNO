//
//  FriendCard.swift
//  WhyNot
//
//  Created by Fernando Santos on 23/11/22.
//

import SwiftUI

struct FriendCardView: View {
    @ObservedObject var viewModel: FriendCardViewModel

    var body: some View {
        HStack {
            HStack(spacing: Space.space1x) {
                PersonImage(
                    ratio: FriendsConstants.ratio,
                    personImage: Image(uiImage: viewModel.getImage())
                )
                Text(viewModel.getName()).foregroundColor(Color.CustomColor.titleColor)
            }

            Spacer()

            if viewModel.haveButton {
                Button(action: {
                    viewModel.performAction()
                }, label: {
                    viewModel.getButtonLabel()
                })
            }
        }
    }
}
