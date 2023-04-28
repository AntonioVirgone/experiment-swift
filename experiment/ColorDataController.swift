//
//  ColorDataController.swift
//  experiment
//
//  Created by Antonio Virgone on 28/04/23.
//

import Foundation
import CoreData

class ColorDataController: ObservableObject {
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExperimentDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
    static func save(name: String) {
        let color = ColorEntity(context: context)
        color.id = UUID()
        color.name = name
        color.insertDatetime = Date()
        
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
    
    static func find() -> [ColorModel] {
        let fetchRequest = ColorEntity.fetchRequest()
        do {
            var array = [ColorModel]()
            let colors = try context.fetch(fetchRequest)
            
            for color in colors {
                array.append(ColorModel(id: color.id! ?? UUID(), name: color.name ?? "", date: color.insertDatetime ?? Date()))
            }
            
            return array
        } catch {
            print(error)
            return []
        }
    }
    
    static func delete() {
        do {
            let fetchRequest = ColorEntity.fetchRequest()
            let colors = try context.fetch(fetchRequest)
            
            // Delete multiple objects
            for object in colors {
                context.delete(object)
            }
            
            // Save the deletions to the persistent store
            //save(context: context)
        } catch {
            print(error)
        }
    }
}
