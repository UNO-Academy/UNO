//
//  ExperiencesViewModelTests.swift
//  WhyNotUnitTests
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/11/22.
//

import XCTest
@testable import WhyNot
@testable import Pods_WhyNot

class ExperienceRepositoryTest: ExperienceRepository {

    let toDoSize: Int
    let doneSize: Int

    init(toDoSize: Int, doneSize: Int) {
        self.toDoSize = toDoSize
        self.doneSize = doneSize
    }

    func getActiveExperiences() -> ActiveExperiences {
        return ActiveExperiences(
            toDo: [Experience](repeating: getExperienceExample(), count: toDoSize),
            done: [Experience](repeating: getExperienceExample(), count: doneSize)
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
            expirationDate: Date.now,
            isActive: true,
            name: "Experience x"
        )
    }
}

final class ExperiencesViewModelTests: XCTestCase {

    func test_all_experiences_are_undone() {

        let repository = ExperienceRepositoryTest(toDoSize: 4, doneSize: 0)
        let viewModel = ExperiencesViewModel(repository)

        XCTAssertEqual(viewModel.toDoExperiences.count, 4)
        XCTAssertEqual(viewModel.doneExperiences.count, 0)

        XCTAssertEqual(viewModel.mustShowEmptyLived, true)
        XCTAssertEqual(viewModel.mustShowSpaceLeft, false)
        XCTAssertEqual(viewModel.mustShowAllDone, false)
    }

    func test_experiences_done_and_undone() {

        let repository = ExperienceRepositoryTest(toDoSize: 2, doneSize: 2)
        let viewModel = ExperiencesViewModel(repository)

        XCTAssertEqual(viewModel.toDoExperiences.count, 2)
        XCTAssertEqual(viewModel.doneExperiences.count, 2)

        XCTAssertEqual(viewModel.mustShowEmptyLived, false)
        XCTAssertEqual(viewModel.mustShowSpaceLeft, true)
        XCTAssertEqual(viewModel.mustShowAllDone, false)
    }

    func test_all_experiences_are_done() {

        let repository = ExperienceRepositoryTest(toDoSize: 0, doneSize: 4)
        let viewModel = ExperiencesViewModel(repository)

        XCTAssertEqual(viewModel.toDoExperiences.count, 0)
        XCTAssertEqual(viewModel.doneExperiences.count, 4)

        XCTAssertEqual(viewModel.mustShowEmptyLived, false)
        XCTAssertEqual(viewModel.mustShowSpaceLeft, false)
        XCTAssertEqual(viewModel.mustShowAllDone, true)
    }

    func test_expires_today() {

        let repository = ExperienceRepositoryTest(toDoSize: 0, doneSize: 4)
        let viewModel = ExperiencesViewModel(repository)

        XCTAssertEqual(viewModel.daysLeft, 0)
    }

}
