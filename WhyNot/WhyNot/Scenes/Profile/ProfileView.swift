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
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                Text("Name")
                    .font(.custom(
                        CustomFonts.SolidThemeFont,
                        size: FontSize.title2
                    ))

                Group {
                    Form {
                        Text("Friends")
                    }
                }

                Spacer()
            }
            .padding(.top)
            .toolbar {
                Button {

                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
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
