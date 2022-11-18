//
//  ExperiencesViewModelTests.swift
//  WhyNotUnitTests
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/11/22.
//

import XCTest
@testable import WhyNot
@testable import Pods_WhyNot
import FirebaseFirestoreSwift
import FirebaseFirestore

final class ExperiencesViewModelTests: XCTestCase {

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

    func test_experiences_done_and_undone() {

        let expectation = XCTestExpectation(description: #function)

        let repository = GetActiveExperiencesUseCaseMock(toDoSize: 2, doneSize: 2)
        let viewModel = ExperiencesViewModel(repository) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)

        XCTAssertEqual(viewModel.toDoExperiences.count, 2)
        XCTAssertEqual(viewModel.doneExperiences.count, 2)

        XCTAssertEqual(viewModel.mustShowEmptyLived, false)
        XCTAssertEqual(viewModel.mustShowSpaceLeft, true)
        XCTAssertEqual(viewModel.mustShowAllDone, false)
    }

    func test_all_experiences_are_done() {

        let expectation = XCTestExpectation(description: #function)

        let repository = GetActiveExperiencesUseCaseMock(toDoSize: 0, doneSize: 4)
        let viewModel = ExperiencesViewModel(repository) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)

        XCTAssertEqual(viewModel.toDoExperiences.count, 0)
        XCTAssertEqual(viewModel.doneExperiences.count, 4)

        XCTAssertEqual(viewModel.mustShowEmptyLived, false)
        XCTAssertEqual(viewModel.mustShowSpaceLeft, false)
        XCTAssertEqual(viewModel.mustShowAllDone, true)
    }

    func test_expires_today() {

        let expectation = XCTestExpectation(description: #function)

        let repository = GetActiveExperiencesUseCaseMock(toDoSize: 4, doneSize: 0, daysLeft: 0)
        let viewModel = ExperiencesViewModel(repository) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)

        XCTAssertEqual(viewModel.daysLeft, 0)
    }

    func test_expires_seven_days_from_now() {

        let expectation = XCTestExpectation(description: #function)

        let repository = GetActiveExperiencesUseCaseMock(toDoSize: 0, doneSize: 4, daysLeft: 7)
        let viewModel = ExperiencesViewModel(repository) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)

        XCTAssertEqual(viewModel.daysLeft, 7)
    }

    func test_expired_yesterday() {

        let expectation = XCTestExpectation(description: #function)

        let repository = GetActiveExperiencesUseCaseMock(toDoSize: 2, doneSize: 2, daysLeft: -1)
        let viewModel = ExperiencesViewModel(repository) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)

        XCTAssertEqual(viewModel.daysLeft, 0)
    }

}

class GetActiveExperiencesUseCaseMock: GetActiveExperiencesUseCase {

    let oneDay = 60 * 60 * 24

    let toDoSize: Int
    let doneSize: Int
    let daysLeft: Int

    init(toDoSize: Int, doneSize: Int, daysLeft: Int = 0) {
        self.toDoSize = toDoSize
        self.doneSize = doneSize
        self.daysLeft = daysLeft
    }

    func execute() async -> ActiveExperiences {
        return ActiveExperiences(
            toDoExperiences: [Experience](repeating: getExperienceExample(), count: toDoSize),
            doneExperiences: [Experience](repeating: getExperienceExample(), count: doneSize)
        )
    }

    func getExperienceExample() -> Experience {
        return Experience(
            id: "id",
            category: "Explore",
            cost: 1,
            description: "Description",
            duration: 1,
            effort: 1,
            expirationDate: Timestamp(date: Date(timeInterval: TimeInterval(daysLeft * oneDay), since: Date.now)),
            isActive: true,
            name: "Experience x"
        )
    }
}
