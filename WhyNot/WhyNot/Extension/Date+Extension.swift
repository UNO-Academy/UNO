//
//  Date+Extension.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 16/11/22.
//

import Foundation

extension Date {

    func getDay() -> Int? {
        return Calendar.current.dateComponents([.day], from: self).day
    }
}
