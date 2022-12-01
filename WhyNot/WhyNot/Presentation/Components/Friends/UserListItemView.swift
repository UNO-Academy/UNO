//
//  FriendCard.swift
//  WhyNot
//
//  Created by Fernando Santos on 23/11/22.
//

import SwiftUI

struct UserListItemView: View {

    @ObservedObject var viewModel: UserListItemViewModel

    var body: some View {
        HStack(spacing: Space.space1x) {
            PersonImage(
                ratio: UserConstants.friendRatioSize,
                personImage: Image(uiImage: viewModel.getImage())
            )

            Text(viewModel.getName()).foregroundColor(Color.CustomColor.titleColor)

            Spacer()

            if viewModel.haveButton {
                Button(
                    action: {
                    viewModel.performAction()
                }, label: {
                    Text(viewModel.getButtonLabel()).foregroundColor(viewModel.getButtonCollor())
                })
            }
        }
    }
}
