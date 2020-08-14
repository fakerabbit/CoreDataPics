//
//  EPhoto+CoreDataProperties.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/14/20.
//  Copyright © 2020 idevcode. All rights reserved.
//
//

import Foundation
import CoreData


extension EPhoto {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<EPhoto> {
        return NSFetchRequest<EPhoto>(entityName: "Photo")
    }

    @NSManaged public var downloads: Int16
    @NSManaged public var favorites: Int16
    @NSManaged public var id: Int16
    @NSManaged public var largeImageURL: String
    @NSManaged public var likes: Int16
    @NSManaged public var previewURL: String

}
