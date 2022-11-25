//
//  ProfileViewModel.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 23/11/22.
//

import SwiftUI

class ProfileViewModel: ObservableObject {

    public let user: User
    @Published var isEditing: Bool = false

    init(user: User) {
        self.user = user
    }

    public func editingAction() {

    }

    public func cancelAction() {

    }

}
