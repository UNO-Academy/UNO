//
//  StorageService.swift
//  WhyNot
//
//  Created by Fernando Santos on 18/10/22.
//
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import Foundation

class StorageService {
    static let shared = StorageService()
    private init() {
        FirebaseApp.configure()
    }

    func uploadImage(storageRef: Storage, image: Data) {
        let riversRef = storageRef.reference().child("images/\(UUID().uuidString).jpg")
        riversRef.putData(image, metadata: nil)
    }
    
    func downloadImage(storageRef: Storage, path: String) async throws -> Data? {
        let imageRef = storageRef.reference(withPath: path)
        return try await imageRef.getDataAsync(maxSize: 5 * 1024 * 1024)
    }
    
    func dowloadImageWithCompletion(storageRef: Storage, path: String, completion: @escaping(()->())) {
        let imageRef = storageRef.reference(withPath: path)
        imageRef.getData(maxSize:  5 * 1024 * 1024) data, error in {
            
        }
        
    }
    
    func dowloadImages(idImages: [String]) async -> [Data] {
        var dowloadedImages = [Data]()
        
        for image in idImages {
            do {
                let data = try await downloadImage(idImage: image)
                dowloadedImages.append(data!)
            } catch {
                print(error.localizedDescription)
            }
        }
        return dowloadedImages
    }
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
