//
//  ContentView.swift
//  WhyNot
//
//  Created by Fernando Santos on 07/10/22.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {

    let api: ExperienceAPI = ExperienceAPI(crudService: DataBase(), db: Firestore.firestore())

    var body: some View {
        Text("hello")
    }
}
