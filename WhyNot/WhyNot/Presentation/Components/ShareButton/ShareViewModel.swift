//
//  ShareViewController.swift
//  WhyNot
//
//  Created by Fernando Santos on 14/11/22.
//

import SwiftUI

enum ShareMessage: String {
    case experience = "Se liga nessa nova experiência disponível no WhyNot"
}

class ShareViewModel: ObservableObject {
    let url: URL
    let shareMessage: ShareMessage

    init(url: URL, shareMessage: ShareMessage) {
        self.url = url
        self.shareMessage = shareMessage
    }

    func share() {
        let text = shareMessage.rawValue + " \(url)"
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)

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
