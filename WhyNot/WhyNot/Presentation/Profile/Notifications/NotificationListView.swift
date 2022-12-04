//
//  NotificationListView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 01/12/22.
//

import SwiftUI

class NotificationListViewModel: ObservableObject {
    
    var notifications: [NotificationModel]
    
    init(notifications: [NotificationModel]) {
        self.notifications = notifications
    }
}

struct NotificationListView: View {
    var body: some View {
        List {
            ForEach(1..<10) { index in
                NotificationView(
                    viewModel: NotificationViewModel(
                        notification: NotificationModel(
                            title: "Title \(index)",
                            message: "Message for index \(index)",
                            notificationType: .idea,
                            date: .now
                        )
                    )
                )
            }
        }
        .listStyle(.plain)
        .navigationTitle("Notifications")
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
