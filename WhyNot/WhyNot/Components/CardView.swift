//
//  CardView.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 03/11/22.
//

import SwiftUI

struct CardView: View {

    let experience: Experience

    var body: some View {
        HStack(spacing: Space.space1x) {
            VStack {

            }

            Spacer()


        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(experience: Experience(id: "", name: "", description: "", effort: 2, duration: 3, category: "", isActive: true))
    }
}
