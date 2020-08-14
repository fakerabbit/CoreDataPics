//
//  DataProvider.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/14/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension CoreDataAPI {
    
    func fetchImages(completion: @escaping ([PhotoModel]) -> ()) {
        NetworkAPI.shared.fetchImages { images in
            self.storeNetworkImages(images) {
                self.retrieveAllImages() { storedImages in
                    DispatchQueue.main.async {
                        completion(storedImages)
                    }
                }
            }
        }
    }
    
    func storeNetworkImages(_ images: [PhotoModel], completion: @escaping () -> ()) {
        for image in images {
            let photo = EPhoto(context: self.managedObjectContext)
            photo.id = Int64(image.id)
            photo.downloads = Int64(image.downloads)
            photo.favorites = Int64(image.favorites)
            photo.largeImageURL = image.largeImageURL
            photo.likes = Int64(image.likes)
            photo.previewURL = image.previewURL
        }
        self.saveContext()
        completion()
    }
    
    func retrieveAllImages(completion: @escaping ([PhotoModel]) -> ()) {
        var results: [EPhoto] = []
        var images: [PhotoModel] = []
        do {
            results = try self.managedObjectContext.fetch(EPhoto.createFetchRequest())
            for photo in results {
                let photoModel = PhotoModel(previewURL: photo.previewURL, largeImageURL: photo.largeImageURL, downloads: Int(photo.downloads), likes: Int(photo.likes), favorites: Int(photo.favorites), id: Int(photo.id))
                images.append(photoModel)
            }
            completion(images)
        } catch {
            completion(images)
        }
    }
}
