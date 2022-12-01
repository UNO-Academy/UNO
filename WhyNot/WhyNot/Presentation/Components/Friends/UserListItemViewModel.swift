//
//  FriendCardViewModel.swift
//  WhyNot
//
//  Created by Fernando Santos on 24/11/22.
//

import SwiftUI

enum UserConstants {
    static var friendRatioSize: CGFloat {
        return CGFloat(44)
    }
}

enum UserStatus {
    case request, sent, remove
}

class UserListItemViewModel: ObservableObject {
    var dataImage: Data?
    var name: String
    var id: String
    var userStatus: UserStatus
    var haveButton: Bool

    init(
        user: User,
        userStatus: UserStatus = .request,
        haveButton: Bool = false
    ) {
        self.dataImage = user.profilePicture
        self.name = user.name
        self.id = user.id!
        self.userStatus = userStatus
        self.haveButton = haveButton
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
        if haveButton {
            switch userStatus {
            case .request:
                print("a")
                //TODO: Request frindShipInDB
            case .sent:
                print("a")
                //TODO: Sent
            case .remove:
                print("a")
                //TODO: Remove from friends
            }
        }
    }

    func getButtonLabel() -> String {
        switch userStatus {
        case .request:
            return NSLocalizedString("RequestFriendshipLabel", comment: "")
        case .sent:
            return NSLocalizedString("SentFriendshipLabel", comment: "")
        case .remove:
            return NSLocalizedString("RemoveFriendshipLabel", comment: "")
        }
    }

    func getButtonCollor() -> Color {
        switch userStatus {
        case .request:
            return Color.CustomColor.clicableColor
        case .sent:
            return Color.green
        case .remove:
            return Color.red
        }
    }
}
