//
//  CoreDataAPI.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/13/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataAPI {
    
    static let shared = CoreDataAPI()
    
    // MARK:- Core Data Stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataPics")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    func saveContext () {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved save error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

