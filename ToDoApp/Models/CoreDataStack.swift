import Foundation
import CoreData

class CoreDataStack {
    // lazy - создается только огда когда к свойству обращаются
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoApp")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
    func save() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch {
            print("I can't save it!!! \(error.localizedDescription)")
        }
    }
}