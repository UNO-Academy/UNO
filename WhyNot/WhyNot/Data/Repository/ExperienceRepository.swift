import FirebaseFirestore

protocol ExperienceRepository {

    func fetchExperiences() async throws -> [Experience]
}
