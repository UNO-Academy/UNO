//
//  ContentView.swift
//  WhyNot
//
//  Created by Fernando Santos on 07/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var planOn = false
    @State var exp: Experience? = nil
    var body: some View {
        
        VStack {
            if planOn {
                Planilha(exp: exp).padding()
            }
            Text("Hello, world!")
                .padding()
            
            Button("aiaia") {
                Task {
                    DataBase.shared.uploadImage()
                }
                
            }.padding()
             .background(.yellow)
        }
    }
}

struct Planilha: View {
    var exp: Experience?
    var body: some View {
        VStack {
            Text(exp?.name ?? "")
            Text(String(exp?.effort ?? 0) ?? "")
            Text(String(exp?.duration ?? 0) ?? "")
            Text(exp?.description ?? "")
            Text(exp?.category ?? "")
        }.background(.red)
    }
}
