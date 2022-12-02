//
//  DoneBtnViewModel.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 22/11/22.
//

import SwiftUI

enum DoneBtnConfigConstants {
    static let disabledColor = Color.CustomColor.doneDisabledBtn
    static let enabledColor = Color(UIColor.systemOrange)
    static let localizeDisabled: LocalizedStringKey = "doneButtonDisabled"
    static let localizeEnabled: LocalizedStringKey = "doneButton"
}

class DoneBtnViewModel: ObservableObject {
    var experienceTitle: String
    @Binding var isExperienceDone: Bool
    @Published var showConfirmAlert: Bool = false

    init(experienceTitle: String, isExperienceDone: Binding<Bool>) {
        self.experienceTitle = experienceTitle
        self._isExperienceDone = isExperienceDone
    }

    func getBtnLocalized () -> LocalizedStringKey {
        return isExperienceDone ? DoneBtnConfigConstants.localizeDisabled : DoneBtnConfigConstants.localizeEnabled
    }

    func getBtnImage () -> String {
        return isExperienceDone ? Icons.flag2CrossedFill : Icons.flagFill
    }

    func getBtnColor () -> Color {
        return isExperienceDone ? DoneBtnConfigConstants.disabledColor : DoneBtnConfigConstants.enabledColor
    }

    func onDoneSuccess () {
        // TODO: add done request here
        self.isExperienceDone = true
    }

    func activateAlert () {
        self.showConfirmAlert = true
    }
}
