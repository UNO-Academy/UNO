//
//  WhyNotUnitTests.swift
//  WhyNotUnitTests
//
//  Created by Fernando Santos on 10/11/22.
//

import XCTest
@testable import WhyNot

class WhyNotUnitTests: XCTestCase {

    func testMoreThan4Person() {
        let viewModel = PeopleVM(images: [
            UIImage(named: "AppIcon")!,
            UIImage(named: "AppIcon")!,
            UIImage(named: "AppIcon")!,
            UIImage(named: "AppIcon")!,
            UIImage(named: "AppIcon")!
        ])
        XCTAssertEqual(viewModel.getActualMaxImagesNumber(), 4)
        XCTAssertEqual(viewModel.howManyPeopleRemains(), 1)
        XCTAssertEqual(viewModel.needPlusCard(), true)
    }

    func testLessThan4Person() {
        let viewModel = PeopleVM(images: [
            UIImage(named: "AppIcon")!,
            UIImage(named: "AppIcon")!
        ])
        XCTAssertEqual(viewModel.getActualMaxImagesNumber(), 2)
        XCTAssertEqual(viewModel.howManyPeopleRemains(), 0)
        XCTAssertEqual(viewModel.needPlusCard(), false)
    }

    func testNoPeople() {
        let viewModel = PeopleVM(images: [])
        XCTAssertEqual(viewModel.getActualMaxImagesNumber(), 0)
        XCTAssertEqual(viewModel.howManyPeopleRemains(), 0)
        XCTAssertEqual(viewModel.needPlusCard(), false)
    }

}
