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
    let user1 = User(
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

    let user2 = User(
        id: "ID2",
        name: "Fernando",
        profilePictureID: "A",
        profilePicture: nil,
        lastPictureUpdate: Date.now,
        friendsID: [],
        mementosID: [],
        doneExperiencesID: [],
        interestExperiencesID: []
    )

    let user3 = User(
        id: "ID1",
        name: "Bassani",
        profilePictureID: "B",
        profilePicture: nil,
        lastPictureUpdate: Date.now,
        friendsID: [],
        mementosID: [],
        doneExperiencesID: [],
        interestExperiencesID: []
    )

    func test_if_two_view_model_are_equal() {
        let viewModel1 = UserListItemViewModel(user: user1)
        let viewModel2 = UserListItemViewModel(user: user2)
        let viewModel3 = UserListItemViewModel(user: user3)
        let sameId = (viewModel1 == viewModel2)
        XCTAssertEqual(sameId, false)

        let differentId = (viewModel1 == viewModel3)
        XCTAssertEqual(differentId, true)
    }

    func test_button_labels() {
        let userListItemViewModel = UserListItemViewModel(user: user1)
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
        let userListItemViewModel = UserListItemViewModel(user: user1)
        XCTAssertEqual(userListItemViewModel.getButtonCollor(), Color.CustomColor.clicableColor)

        userListItemViewModel.userStatus = UserStatus.remove
        XCTAssertEqual(userListItemViewModel.getButtonCollor(), Color.red)

        userListItemViewModel.userStatus = UserStatus.sent
        XCTAssertEqual(userListItemViewModel.getButtonCollor(), Color.green)
    }
}
