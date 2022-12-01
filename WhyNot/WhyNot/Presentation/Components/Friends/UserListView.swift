//
//  FriendsCollectionCard.swift
//  WhyNot
//
//  Created by Fernando Santos on 23/11/22.
//

import SwiftUI

struct UserListView: View {
    var friends: [User]

    var body: some View {
        List {
            ForEach(friends, id: \.self) { friend in
                UserListItemView(viewModel: UserListItemViewModel(user: friend))
            }
        }
    }
}

struct UserListPreviewProvider: PreviewProvider {

    static var previews: some View {
        UserListView(friends: [
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
