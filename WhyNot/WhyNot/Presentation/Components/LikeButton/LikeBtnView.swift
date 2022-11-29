//
//  LikeBtnView.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 21/11/22.
//

import SwiftUI

struct LikeBtnView: View {

    @ObservedObject var viewModel: LikeBtnViewModel

    var body: some View {
        Button {
            viewModel.onLikeSuccess()
        } label: {
            Image(systemName: viewModel.btnIcon)
        }
        .foregroundColor(Color.CustomColor.clicableColor)
    }
}
