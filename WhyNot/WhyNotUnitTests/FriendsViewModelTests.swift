//
//  FriendsViewModelTests.swift
//  WhyNotUnitTests
//
//  Created by Fernando Santos on 28/11/22.
//

import XCTest
@testable import WhyNot

final class FriendsViewModelTests: XCTestCase {

    func test_all_experiences_are_undone() {

        let expectation = XCTestExpectation(description: #function)

        let repository = GetActiveExperiencesUseCaseMock(toDoSize: 4, doneSize: 0)
        let viewModel = ExperiencesViewModel(repository) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)

        XCTAssertEqual(viewModel.toDoExperiences.count, 4)
        XCTAssertEqual(viewModel.doneExperiences.count, 0)

        XCTAssertEqual(viewModel.mustShowEmptyLived, true)
        XCTAssertEqual(viewModel.mustShowSpaceLeft, false)
        XCTAssertEqual(viewModel.mustShowAllDone, false)
    }
}
