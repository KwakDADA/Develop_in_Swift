//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by 곽다은 on 2/22/24.
//

import Foundation
import UIKit

class PhotoInfoController {
    enum PhotoInfoError: Error, LocalizedError {
        case itemNotFound
        case imageDataMissing
    }
    
    func fetchPhotoInfo() async throws -> PhotoInfo {
        var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        urlComponents.queryItems = [
            "api_key": "DEMO_KEY"
        ].map{ URLQueryItem(name: $0.key, value: $0.value) }

        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
        
        return photoInfo
    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        guard let image = UIImage(data: data) else {
            throw PhotoInfoError.imageDataMissing
        }
        
        return image
    }
}
