//
//  ShareViewController.swift
//  WhyNot
//
//  Created by Fernando Santos on 14/11/22.
//

import SwiftUI

class ShareViewModel: ObservableObject {
    let url: URL

    init(url: URL) {
        self.url = url
    }

    func share() {
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)

        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }

        guard let firstWindow = firstScene.windows.first else {
            return
        }

        if let viewController = firstWindow.rootViewController {
            viewController.present(activityController, animated: true)
        }
    }
}
