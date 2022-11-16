//
//  FriendsList.swift
//  WhyNot
//
//  Created by Fernando Santos on 14/11/22.
//

import SwiftUI

struct FriendsList: View {
    let dataArrays = ["ole ole", "ole ola", "Dilma", "Dilma"]

    var body: some View {
        List {
            ForEach(0..<dataArrays.count) { each in
                FriendsCard(image: Image(uiImage: UIImage(named: "AppIcon")!),name: dataArrays[each], action: {print("a")} )
            }
        }
    }
}

struct Vider: PreviewProvider {
    static var previews: some View {
        FriendsList().preferredColorScheme(.dark)
    }
}
