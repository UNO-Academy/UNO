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
            TagsView(expirience: Experience(id: "aaa",
                                                  name: "aaa",
                                                  description: "aaa",
                                                  effort: 2,
                                                  duration: 2,
                                                  cost: 1,
                                                  category:"a",
                                                  isActive: false))
            .onAppear {
                FirebaseApp.configure()
            }
        }
    }
}
