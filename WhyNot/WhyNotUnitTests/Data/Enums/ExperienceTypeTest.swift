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

// swiftlint:disable type_name
class when_creating_an_enabled_category_get_the_correct_primary_color_successfully: XCTestCase {

    func test_correct_color_for_cooking_category() {
        let correctAnswer: Color = Color("primaryRed")
        let category: ExperienceType = .cooking

        XCTAssertEqual(correctAnswer, category.getCorrectPrimaryColor())
    }

    func test_correct_color_for_adventure_category() {
        let correctAnswer: Color = Color("primaryYellow")
        let category: ExperienceType = .adventure

        XCTAssertEqual(correctAnswer, category.getCorrectPrimaryColor())
    }

    func test_correct_color_for_explore_category() {
        let correctAnswer: Color = Color("primaryGreen")
        let category: ExperienceType = .explore

        XCTAssertEqual(correctAnswer, category.getCorrectPrimaryColor())
    }

}

// swiftlint:disable type_name
class when_creating_an_enabled_category_get_the_correct_secondary_color_successfully: XCTestCase {

    func test_correct_color_for_cooking_category() {
        let correctAnswer: Color = Color("secondaryRed")
        let category: ExperienceType = .cooking

        XCTAssertEqual(correctAnswer, category.getCorrectSecondaryColor())
    }

    func test_correct_color_for_adventure_category() {
        let correctAnswer: Color = Color("secondaryYellow")
        let category: ExperienceType = .adventure

        XCTAssertEqual(correctAnswer, category.getCorrectSecondaryColor())
    }

    func test_correct_color_for_explore_category() {
        let correctAnswer: Color = Color("secondaryGreen")
        let category: ExperienceType = .explore

        XCTAssertEqual(correctAnswer, category.getCorrectSecondaryColor())
    }

}

// swiftlint:disable type_name
class when_creating_a_disabled_category_get_the_correct_primary_color_successfully: XCTestCase {

    func test_correct_color_for_cooking_category() {
        let correctAnswer: Color = Color.PrimaryPallet.disable
        let category: ExperienceType = .cooking

        XCTAssertEqual(correctAnswer, category.getCorrectPrimaryColor(false))
    }

    func test_correct_color_for_adventure_category() {
        let correctAnswer: Color = Color.PrimaryPallet.disable
        let category: ExperienceType = .adventure

        XCTAssertEqual(correctAnswer, category.getCorrectPrimaryColor(false))
    }

    func test_correct_color_for_explore_category() {
        let correctAnswer: Color = Color.PrimaryPallet.disable
        let category: ExperienceType = .explore

        XCTAssertEqual(correctAnswer, category.getCorrectPrimaryColor(false))
    }

}

// swiftlint:disable type_name
class when_creating_a_disabled_category_get_the_correct_secondary_color_successfully: XCTestCase {

    func test_correct_color_for_cooking_category() {
        let correctAnswer: Color = Color.SecondaryPallet.disable
        let category: ExperienceType = .cooking

        XCTAssertEqual(correctAnswer, category.getCorrectSecondaryColor(false))
    }

    func test_correct_color_for_adventure_category() {
        let correctAnswer: Color = Color.SecondaryPallet.disable
        let category: ExperienceType = .adventure

        XCTAssertEqual(correctAnswer, category.getCorrectSecondaryColor(false))
    }

    func test_correct_color_for_explore_category() {
        let correctAnswer: Color = Color.SecondaryPallet.disable
        let category: ExperienceType = .explore

        XCTAssertEqual(correctAnswer, category.getCorrectSecondaryColor(false))
    }

}
