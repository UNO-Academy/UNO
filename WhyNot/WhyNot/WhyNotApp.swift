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
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(perform: {
                FirebaseApp.configure()
            })
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Essa contentView só extiste pra larissa não surtar")
    }
}
