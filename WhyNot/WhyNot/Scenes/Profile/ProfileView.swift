//
//  ProfileView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ProfileView: View {

    private let viewModel: ProfileViewModel

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                Text("Name")
                    .font(.custom(
                        CustomFonts.SolidThemeFont,
                        size: FontSize.title2
                    ))

                Form {
                    Text("Friends")
                    Text("Notifications")
                }.scrollContentBackground(.hidden)

                Spacer()
            }
            .padding(.top)
            .toolbar {
                Button {
                    viewModel.editingAction()
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                }

            }
            .navigationTitle("Profile")
        }
    }
}

//struct ProfilePreviewProvider: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
