//
//  FriendCardViewModel.swift
//  WhyNot
//
//  Created by Fernando Santos on 24/11/22.
//

import SwiftUI

enum FriendsConstants {
    static var friendRatioSize: CGFloat {
        return CGFloat(44)
    }
}

enum FriendStatus {
    case request, sent, remove
}

class FriendCardViewModel: ObservableObject, Hashable {
    var dataImage: Data?
    var name: String
    var id: String
    var friendStatus: FriendStatus
    var haveButton: Bool
    var action: () -> Void

    init(
        user: User,
        friendStatus: FriendStatus = .request,
        haveButton: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.dataImage = user.profilePicture
        self.name = user.name
        self.id = user.id!
        self.friendStatus = friendStatus
        self.haveButton = haveButton
        self.action = action
    }

    static func == (lhs: FriendCardViewModel, rhs: FriendCardViewModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    func getImage() -> UIImage {
        let emptyPersonImage = UIImage(systemName: "person.crop.circle")!
        guard let dataImage = dataImage else { return  emptyPersonImage }
        guard let uiImage = UIImage(data: dataImage) else { return emptyPersonImage }
        return uiImage
    }

    func getName() -> String {
        return name
    }

    func performAction() {
        action()
    }

    func getButtonLabel() -> String {
        switch friendStatus {
        case .request:
            return NSLocalizedString("RequestFriendshipLabel", comment: "")
        case .sent:
            return NSLocalizedString("SentFriendshipLabel", comment: "")
        case .remove:
            return NSLocalizedString("RemoveFriendshipLabel", comment: "")
        }
    }

    func getButtonCollor() -> Color {
        switch friendStatus {
        case .request:
            return Color.CustomColor.clicableColor
        case .sent:
            return Color.green
        case .remove:
            return Color.red
        }
    }
}
