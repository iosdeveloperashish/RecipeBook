//
//  PersistantStorage.swift
//  RecipeBook
//
//  Created by Ashish Viltoriya on 31/01/21.
//

import Foundation
import CoreData

final class PersistantStorage {
    
    private init() { }
    static let shared = PersistantStorage()
    lazy var context = persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "RecipeBook")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllData(entityName: String) {
        let managedContext = PersistantStorage.shared.context
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false

        do {
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]

            for item in items {
                managedContext.delete(item)
            }

            // Save Changes
            try managedContext.save()

        } catch let error {
            debugPrint(error)
        }
    }
    
}
