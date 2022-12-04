//
//  NotificationView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 29/11/22.
//

import SwiftUI

enum NotificationType {
    case idea, friendRequest, newExperiences
}

class NotificationViewModel: ObservableObject {

    let notification: NotificationModel

    var convertedDate: String {
        notification.date.convertToString()
    }

    var iconName: String {
        switch notification.notificationType {
        case .idea:
            return "lightbulb"
        case .friendRequest:
            return "star"
        case .newExperiences:
            return "person.2"
        }
    }

    init(
        notification: NotificationModel
    ) {
        self.notification = notification
    }

}

struct NotificationView: View {

    let viewModel: NotificationViewModel

    var body: some View {
        HStack(alignment: .top, spacing: Space.space1x) {
            Circle()
                .fill(Color.CustomColor.clicableColor)
                .frame(width: 60)
                .overlay {
                    Image(systemName: viewModel.iconName)
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(Color(uiColor: .systemBackground))
                }

            VStack(alignment: .leading) {
                Text(viewModel.notification.title)
                    .font(.title2)

                Text(viewModel.notification.message)
                    .font(.body)

                Text(viewModel.convertedDate)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(
            viewModel: NotificationViewModel(
                notification: NotificationModel(
                    title: "Why not do a Pudim?",
                    message: "Call some friends to do this brasilian disseart that is so yummy",
                    notificationType: .idea,
                    date: Date()
                )
            )
        )
    }
}
