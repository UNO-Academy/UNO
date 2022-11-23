//
//  GetActiveExperiencesUseCaseTests.swift
//  WhyNotUnitTests
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/11/22.
//

import XCTest
@testable import WhyNot
@testable import Pods_WhyNot
import FirebaseFirestoreSwift
import FirebaseFirestore

final class GetActiveExperiencesUseCaseTests: XCTestCase {

    func test_user_not_logged() async throws {

        let experienceRepository = ExperienceRepositoryMock()
        let userRepository = UserRepositoryMock(isLogged: false, done: [])
        let useCase = GetActiveExperiencesUseCaseImpl(
            experienceRepository: experienceRepository,
            userRepository: userRepository
        )

        let activeExperiences = try await useCase.execute()

        XCTAssertEqual(activeExperiences.toDoExperiences.map { $0.id }, ["1", "2", "3", "4"])
        XCTAssertEqual(activeExperiences.doneExperiences.map { $0.id }, [])
    }

    func test_user_did_nothing() async throws {

        let experienceRepository = ExperienceRepositoryMock()
        let userRepository = UserRepositoryMock(isLogged: true, done: [])
        let useCase = GetActiveExperiencesUseCaseImpl(
            experienceRepository: experienceRepository,
            userRepository: userRepository
        )

        let activeExperiences = try await useCase.execute()

        XCTAssertEqual(activeExperiences.toDoExperiences.map { $0.id }, ["1", "2", "3", "4"])
        XCTAssertEqual(activeExperiences.doneExperiences.map { $0.id }, [])
    }

    func test_user_did_half() async throws {

        let experienceRepository = ExperienceRepositoryMock()
        let userRepository = UserRepositoryMock(isLogged: true, done: ["1", "2"])
        let useCase = GetActiveExperiencesUseCaseImpl(
            experienceRepository: experienceRepository,
            userRepository: userRepository
        )

        let activeExperiences = try await useCase.execute()

        XCTAssertEqual(activeExperiences.toDoExperiences.map { $0.id }, ["3", "4"])
        XCTAssertEqual(activeExperiences.doneExperiences.map { $0.id }, ["1", "2"])
    }

    func test_user_did_everything() async throws {

        let experienceRepository = ExperienceRepositoryMock()
        let userRepository = UserRepositoryMock(isLogged: true, done: ["1", "2", "3", "4"])
        let useCase = GetActiveExperiencesUseCaseImpl(
            experienceRepository: experienceRepository,
            userRepository: userRepository
        )

        let activeExperiences = try await useCase.execute()

        XCTAssertEqual(activeExperiences.toDoExperiences.map { $0.id }, [])
        XCTAssertEqual(activeExperiences.doneExperiences.map { $0.id }, ["1", "2", "3", "4"])
    }
}

class ExperienceRepositoryMock: ExperienceRepository {

    func fetchExperiences() async throws -> [Experience] {
        return [
            getExperienceExample(id: "1"),
            getExperienceExample(id: "2"),
            getExperienceExample(id: "3"),
            getExperienceExample(id: "4")
        ]
    }

    func getExperienceExample(id: String) -> Experience {
        return Experience(
            id: id,
            category: "Explore",
            cost: 1,
            description: "Description",
            duration: 1,
            effort: 1,
            expirationDate: Timestamp(),
            isActive: true,
            name: "Experience x"
        )
    }
}

class UserRepositoryMock: UserRepository {

    let isLogged: Bool
    let doneExperiences: [String]

    init(isLogged: Bool, done: [String]) {
        self.isLogged = isLogged
        self.doneExperiences = done
    }

    func isUserLogged() -> Bool {
        return isLogged
    }

    func getLoggedUser() -> User? {
        return isLogged ? getUserExample() : nil
    }

    func getUserExample() -> User {
        return User(
            id: "id",
            name: "erci",
            profilePicture: "photo",
            lastPictureUpdate: Date.now,
            friendsID: [],
            mementosID: [],
            doneExperiencesID: doneExperiences,
            interestExperiencesID: []
        )
    }
}
