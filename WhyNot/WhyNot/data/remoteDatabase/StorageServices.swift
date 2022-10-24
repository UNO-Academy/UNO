//
//  StorageService.swift
//  WhyNot
//
//  Created by Fernando Santos on 18/10/22.
//

import Firebase
import FirebaseStorage
import Foundation

class StorageService {

    static let shared = StorageService()
    private var group: DispatchGroup?

    private init() {
        FirebaseApp.configure()
    }

    func uploadImage(storageRef: Storage, image: Data) {
        let riversRef = storageRef.reference().child("images/\(UUID().uuidString).jpg")
        riversRef.putData(image, metadata: nil)
    }

    func downloadImage(storageRef: Storage, path: String) async throws -> Data? {
        let imageRef = storageRef.reference(withPath: path)
        return try await imageRef.getDataAsync(maxSize: Sizes.maxSize.rawValue * Sizes.maxSize.rawValue)
    }

    // did by will
    func downloadImage(storageRef: Storage, path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let imageRef = storageRef.reference(withPath: path)
        imageRef.getData(maxSize: Sizes.maxSize.rawValue * Sizes.maxSize.rawValue) { (data, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(data!))
            }
        }
    }
    func downloadImages(storageRef: Storage, paths: [String], completion: @escaping ([Data]) -> Void) {
        group = DispatchGroup()
        for _ in paths {
            group?.enter()
        }
        var imagesData: [Data] = []

        let semaphore = DispatchSemaphore(value: 1)
        for path in paths {
            downloadImage(storageRef: storageRef, path: path) { [weak self] result in
                switch result {
                case let .success(data):
                    semaphore.wait()
                    imagesData.append(data)
                    semaphore.signal()
                case let .failure(error):
                    print(error.localizedDescription)
                }
                self?.group?.leave()
            }
        }

        group?.notify(queue: DispatchQueue.global()) {
            print("Terminei de baixar os dados das imagens")
            completion(imagesData)
        }
    }
}

enum Sizes: Int64 {
    case maxSize = 1024
}

extension StorageReference {
    func getDataAsync(maxSize: Int64) async throws -> Data {

    return try await withCheckedThrowingContinuation({ continuation in
        getData(maxSize: maxSize) { data, error in
        if error == nil && data != nil {
        continuation.resume(returning: data!)
        } else {
        continuation.resume(throwing: error!)
        }
        }
    })
    }
}
