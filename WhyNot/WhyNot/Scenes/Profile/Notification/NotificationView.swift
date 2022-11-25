//
//  NotificationView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 23/11/22.
//

import SwiftUI

enum NotificationType {
    case idea, friendRequest, newExperiences
}

class NotificationViewModel: ObservableObject {

    let title: String
    let message: String
    let notificationType: NotificationType
    let date: Date

    var convertedDate: String {
        date.convertToString()
    }

    var iconName: String {
        switch notificationType {
        case .idea:
            return "lightbulb"
        case .friendRequest:
            return "star"
        case .newExperiences:
            return "person.2"
        }
    }

    init(
        title: String,
        message: String,
        notificationType: NotificationType,
        date: Date
    ) {
        self.title = title
        self.message = message
        self.notificationType = notificationType
        self.date = date
    }

}

struct NotificationView: View {

    let viewModel: NotificationViewModel

    var body: some View {
        HStack(alignment: .top, spacing: Space.space1x) {
            Circle()
                .fill(Color.CustomColors.ClicableColor)
                .frame(width: 60)
                .overlay {
                    Image(systemName: viewModel.iconName)
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .foregroundColor(Color(uiColor: .systemBackground))
                }

            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.title2)

                Text(viewModel.message)
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
                title: "Why not do a Pudim?",
                message: "Call some friends to do this brasilian disseart that is so yummy",
                notificationType: .newExperiences,
                date: Date()
            )
        )
    }
}
