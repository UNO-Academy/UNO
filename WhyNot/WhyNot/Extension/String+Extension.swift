//
//  String+Extension.swift
//  WhyNot
//
//  Created by Luís Filipe Nascimento on 04/12/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
