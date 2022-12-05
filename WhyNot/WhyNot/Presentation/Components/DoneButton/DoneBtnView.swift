//
//  DoneBtnView.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 21/11/22.
//

import SwiftUI

enum DoneBtnConstants {
    static let btnHeight: CGFloat = 44
}

struct DoneBtnView: View {
    @ObservedObject var viewModel: DoneBtnViewModel

    var body: some View {
        Button {
            viewModel.activateAlert()
        } label: {
            Label(viewModel.getBtnLocalized(), systemImage: viewModel.getBtnImage())
                .font(Font.body.bold())
                .frame(height: DoneBtnConstants.btnHeight, alignment: .center)
                .frame(maxWidth: .infinity)
        }
        .foregroundColor(.white)
        .background(viewModel.getBtnColor())
        .cornerRadius(CornerRadius.halfRadius)
        .disabled(viewModel.isExperienceDone)
        .alert(isPresented: $viewModel.showConfirmAlert) {
            Alert(
                title: Text(viewModel.experienceTitle),
                message: Text("alertConfirmationMessage"),
                primaryButton: .default(Text("yesButton")) {
                    viewModel.onDoneSuccess()
                },
                secondaryButton: .cancel())
        }
    }
}
