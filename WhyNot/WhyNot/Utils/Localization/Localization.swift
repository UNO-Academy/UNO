//
//  Localization.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 17/11/22.
//

import SwiftUI

struct Localization {

    func forKey(_ key: LocalizedKeys, comment: String = "") -> String {
        return NSLocalizedString(key.rawValue, comment: comment)
    }
}
