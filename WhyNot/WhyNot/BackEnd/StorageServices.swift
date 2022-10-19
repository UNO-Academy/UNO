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
    
    func uploadImage(image: Data) {
        let storageRef = Storage.storage()
        let riversRef = storageRef.reference().child("images/\(UUID().uuidString).jpg")
        riversRef.putData(image, metadata: nil)
    }
    
    func downloadImage(idImage: String) async throws -> Data? {
        let storage = Storage.storage()
        let imageRef = storage.reference().child("images/\(idImage).jpg")
        return try await imageRef.getDataAsync(maxSize: 5 * 1024 * 1024)
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
