//
//  ProfileView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("adventure")
                    .clipShape(Circle())

                Text("Name")
                    .font(.custom(
                        CustomFonts.SolidThemeFont,
                        size: FontSize.title2
                    ))

                Form {
                    Text("Friends")
                }

                Spacer()
            }
            .padding(.top)
            .toolbar {
                Button("Edit") {

                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfilePreviewProvider: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
