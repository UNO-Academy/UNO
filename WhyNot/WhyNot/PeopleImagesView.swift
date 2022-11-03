//
//  PeopleImagesView.swift
//  WhyNot
//
//  Created by Fernando Santos on 03/11/22.
//

import SwiftUI

struct PeopleImagesView: View {
    var body: some View {
        Image("imagemTeste")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .padding(4)
            .background(Color.green)
            .clipShape(Circle())
    }
}

struct PeopleProvider: PreviewProvider {
    static var previews: some View {
        PeopleImagesView()
    }
}
