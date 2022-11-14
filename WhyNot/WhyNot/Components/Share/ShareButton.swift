//
//  ShareButton.swift
//  WhyNot
//
//  Created by Fernando Santos on 14/11/22.
//

import SwiftUI

struct ShareButton: View {
    @ObservedObject var viewModel: ShareViewModel

    init(url: URL) {
        self.viewModel = ShareViewModel(url: url)
    }

    var body: some View {
        Button(action: viewModel.share) {
            Image(systemName: "square.and.arrow.up")
        }.foregroundColor(Color.CustomColors.ClicableColor)
    }
}
