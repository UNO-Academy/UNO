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

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
