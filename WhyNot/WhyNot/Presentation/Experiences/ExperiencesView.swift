//
//  ExperiencesView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

struct ExperiencesView: View {
    @State var jsonString: String = ""
    var control = PopulateDatabaseControl()

    var body: some View {
        VStack {
            Text("insert your json here:")
            TextEditor(text: $jsonString)
            Button("Populate") {
                Task {
                    await control.populateFromString(text: jsonString)
                }
            }
        }
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesView()
    }
}
