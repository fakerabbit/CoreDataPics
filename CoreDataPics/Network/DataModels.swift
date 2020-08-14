//
//  DataModels.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/13/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation

struct HitsModel: Decodable {
    let hits: [PhotoModel]
}

struct PhotoModel: Decodable {
    let previewURL: String,
    largeImageURL: String,
    downloads: Int,
    likes: Int,
    favorites: Int,
    id: Int
}

enum ImageError: Error {
    case statusCode, decoding, invalidImage, invalidURL, other(Error)
    
    static func map(_ error: Error) -> ImageError {
      return (error as? ImageError) ?? .other(error)
    }
}
