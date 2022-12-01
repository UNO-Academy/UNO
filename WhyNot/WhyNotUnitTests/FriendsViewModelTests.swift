//
//  FriendsViewModelTests.swift
//  WhyNotUnitTests
//
//  Created by Fernando Santos on 28/11/22.
//

import XCTest
import SwiftUI
@testable import WhyNot

final class UserListViewModelTests: XCTestCase {
    let user = User(
        id: "ID1",
        name: "Fernando",
        profilePictureID: "A",
        profilePicture: nil,
        lastPictureUpdate: Date.now,
        friendsID: [],
        mementosID: [],
        doneExperiencesID: [],
        interestExperiencesID: []
    )

    func test_button_labels() {
        let userListItemViewModel = UserListItemViewModel(user: user)
        XCTAssertEqual(
            userListItemViewModel.getButtonLabel(),
            NSLocalizedString("RequestFriendshipLabel", comment: "")
        )

        userListItemViewModel.userStatus = UserStatus.remove
        XCTAssertEqual(
            userListItemViewModel.getButtonLabel(),
            NSLocalizedString("RemoveFriendshipLabel", comment: "")
        )
        userListItemViewModel.userStatus = UserStatus.sent
        XCTAssertEqual(
            userListItemViewModel.getButtonLabel(),
            NSLocalizedString("SentFriendshipLabel", comment: "")
        )
    }

    func test_button_colors() {
        let userListItemViewModel = UserListItemViewModel(user: user)
        XCTAssertEqual(userListItemViewModel.getButtonCollor(), Color.CustomColor.clicableColor)

        userListItemViewModel.userStatus = UserStatus.remove
        XCTAssertEqual(userListItemViewModel.getButtonCollor(), Color.red)

        userListItemViewModel.userStatus = UserStatus.sent
        XCTAssertEqual(userListItemViewModel.getButtonCollor(), Color.green)
    }
}
