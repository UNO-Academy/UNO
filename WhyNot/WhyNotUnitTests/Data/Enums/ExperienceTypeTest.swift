//
//  ExperienceTypeTest.swift
//  WhyNotUnitTests
//
//  Created by Luís Filipe Nascimento on 11/11/22.
//

import XCTest
import SwiftUI
@testable import WhyNot
@testable import Pods_WhyNot

class when_creating_a_category_get_the_correct_primary_color_successfully: XCTestCase {

    func test_correct_color_for_cooking_category() {
        let correctAnswer: Color = Color { return Color("primaryRed") }
    }

}
