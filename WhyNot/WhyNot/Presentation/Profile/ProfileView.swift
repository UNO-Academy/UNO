//
//  ProfileView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

enum NavigationType: String {
    case notification, friends

    func getNavigationView() -> AnyView {
        switch self {
        case .notification:
            return AnyView(NotificationListView())
        case .friends:
            return AnyView(Text("teste"))
        }
    }
}

extension NavigationType: Identifiable {
    var id: Self { self }
}

struct ProfileView: View {

    let viewModel: ProfileViewModel?
    let navigationOptions: [NavigationType] = [.notification, .friends]

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())

                Text("Name")
                    .font(.custom(
                        CustomFonts.SolidThemeFont,
                        size: FontSize.title2
                    ))

                List {
                    ForEach(navigationOptions, id: \.self) { navigation in
                        NavigationLink(value: navigation, label: {
                            Text(navigation.rawValue.capitalizingFirstLetter())
                        })

                    }
                }
                .navigationDestination(for: NavigationType.self) { navigation in
                    navigation.getNavigationView()
                }

                //                Form {
                //
                //                }.scrollContentBackground(.hidden)

                Spacer()
            }
            .padding(.top)
            .toolbar {
                Button {
                    viewModel?.editingAction()
                } label: {
                    Image(systemName: "square.and.pencil")
                }

            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: nil)
    }
}
