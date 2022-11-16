//
//  FriendCard.swift
//  WhyNot
//
//  Created by Fernando Santos on 14/11/22.
//

import SwiftUI

enum FriendsConstants {
    static var ratio: CGFloat { return CGFloat(44) }
    static var buttonText: String { return "Request" }
}

struct FriendsCard: View {
    let image: Image
    let name: String
    let action: () -> ()

    var body: some View {
        HStack {
            HStack(spacing: Space.space1x) {
                PersonImage(ratio: FriendsConstants.ratio, personImage: image)
                Text(name).foregroundColor(Color.CustomColors.TitleColor)
            }
            Spacer()
            Button(action: {
                action()
            },
            label: {
                Text(FriendsConstants.buttonText)
                    .foregroundColor(Color.CustomColors.ClicableColor)
            })
        }
    }
}

struct Veder: PreviewProvider {
    static var previews: some View {
        FriendsCard(image: Image(uiImage: UIImage(named: "AppIcon")!), name: "aaaaa", action: { print("aaaa")})
    }
}
