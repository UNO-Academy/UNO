//
//  FriendsCard.swift
//  WhyNot
//
//  Created by Fernando Santos on 23/11/22.
//

import SwiftUI

struct FriendsCollectionView: View {
    var friends: [User]

    var body: some View {
        List {
            ForEach(friends, id: \.self) { friend in
                FriendCardView(viewModel: FriendCardViewModel(user: friend))
            }
        }
    }
}

struct Vider: PreviewProvider {

    static var previews: some View {
        FriendsCollectionView(friends: [
            User(id: "1",
            name: "Joana",
            profilePictureID: "",
            profilePicture: nil,
            lastPictureUpdate: Date(),
            friendsID: [],
            mementosID: [],
            doneExperiencesID: [],
            interestExperiencesID: []
        ),
            User(id: "2",
            name: "Joana",
            profilePictureID: "",
            profilePicture: nil,
            lastPictureUpdate: Date(),
            friendsID: [],
            mementosID: [],
            doneExperiencesID: [],
            interestExperiencesID: []
        )])
    }
}
