//
//  FriendViewModel.swift
//  WhyNot
//
//  Created by Fernando Santos on 24/11/22.
//

import SwiftUI

enum FriendsConstants {
    static var ratio: CGFloat {
        return CGFloat(44)
    }
}

enum FriendStatus {
    case request, sent, remove
}

class FriendCardViewModel: ObservableObject, Hashable {
    var image: Data?
    var name: String
    var friendStatus: FriendStatus
    var haveButton: Bool
    var action: () -> Void

    init(
        user: User,
        friendStatus: FriendStatus = .request,
        haveButton: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.name = user.name
        self.image = user.lastPicture
        self.friendStatus = friendStatus
        self.haveButton = haveButton
        self.action = action
    }

    static func == (lhs: FriendCardViewModel, rhs: FriendCardViewModel) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    func getImage() -> UIImage {
        if let image = image {
            return UIImage(data: image)!
        } else {
            return UIImage(systemName: "person.crop.circle")!
        }
    }

    func getName() -> String {
        return name
    }

    func performAction() {
        action()
    }

    func getButtonLabel() -> Text {
        switch friendStatus {
        case .request:
            return Text("Request").foregroundColor(Color.CustomColor.clicableColor)
        case .sent:
            return Text("Sent").foregroundColor(Color.green)
        case .remove:
            return Text("remove").foregroundColor(Color.red)
        }
    }
}
