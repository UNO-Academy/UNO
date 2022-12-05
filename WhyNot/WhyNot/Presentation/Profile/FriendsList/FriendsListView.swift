//
//  FriendsListView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 04/12/22.
//

import SwiftUI

enum FriendListType: Hashable {
    case request, friend
}

struct FriendListModel {
    let type: FriendListType
    let friends: [String]
}

struct FriendsListView: View {

    @State private var friendsSelection: FriendListType = .request
    var friendsList: [String] = ["Batata", "Casaro", "Ballet"]
    var requestList: [String] = ["Lari", "Will", "Erci"]

    var body: some View {
        VStack {
            Picker(selection: $friendsSelection) {
                Text("Request").tag(FriendListType.request)
                Text("My Friends").tag(FriendListType.friend)
            } label: {

            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            if friendsSelection == .friend {
                List {
                    ForEach(friendsList, id: \.self) { friendsName in
                        Text(friendsName)
                    }
                }.listStyle(.sidebar)
            } else if friendsSelection == .request {
                List {
                    ForEach(requestList, id: \.self) { friendsName in
                        Text(friendsName).listRowInsets(.none)
                    }
                }.listStyle(.sidebar)
            }

            Spacer()
        }
        .navigationTitle("Friends")
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
