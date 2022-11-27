//
//  WhyNotApp.swift
//  WhyNot
//
//  Created by Fernando Santos on 07/10/22.
//

import SwiftUI
import Firebase

@main
struct WhyNotApp: App {
    var urlManager = URLManager()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(urlManager).onOpenURL { url in
                urlManager.checkDeepLink(url: url)
            }
        }
    }
}
