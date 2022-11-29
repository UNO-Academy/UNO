//
//  FriendsViewModelTests.swift
//  WhyNotUnitTests
//
//  Created by Fernando Santos on 28/11/22.
//

import XCTest
import SwiftUI
@testable import WhyNot

final class FriendsViewModelTests: XCTestCase {
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
        let viewModel1 = FriendCardViewModel(user: user1)
        let viewModel2 = FriendCardViewModel(user: user2)
        let viewModel3 = FriendCardViewModel(user: user3)
        let sameId = (viewModel1 == viewModel2)
        XCTAssertEqual(sameId, false)

        let differentId = (viewModel1 == viewModel3)
        XCTAssertEqual(differentId, true)
    }

    func test_button_labels() {
        let friendCardViewModel = FriendCardViewModel(user: user1)
        XCTAssertEqual(
            friendCardViewModel.getButtonLabel(),
            NSLocalizedString("RequestFriendshipLabel", comment: "")
        )

        friendCardViewModel.friendStatus = FriendStatus.remove
        XCTAssertEqual(
            friendCardViewModel.getButtonLabel(),
            NSLocalizedString("RemoveFriendshipLabel", comment: "")
        )
        friendCardViewModel.friendStatus = FriendStatus.sent
        XCTAssertEqual(
            friendCardViewModel.getButtonLabel(),
            NSLocalizedString("SentFriendshipLabel", comment: "")
        )
    }

    func test_button_colors() {
        let friendCardViewModel = FriendCardViewModel(user: user1)
        XCTAssertEqual(friendCardViewModel.getButtonCollor(), Color.CustomColor.clicableColor)

        friendCardViewModel.friendStatus = FriendStatus.remove
        XCTAssertEqual(friendCardViewModel.getButtonCollor(), Color.red)

        friendCardViewModel.friendStatus = FriendStatus.sent
        XCTAssertEqual(friendCardViewModel.getButtonCollor(), Color.green)
    }
}
