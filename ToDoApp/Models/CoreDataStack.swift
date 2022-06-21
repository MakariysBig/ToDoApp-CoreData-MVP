<<<<<<< HEAD

=======
>>>>>>> main
import Foundation
import CoreData

class CoreDataStack {
<<<<<<< HEAD
    lazy var managedContext: NSManagedObjectContext = {
        
        return self.storeContainer.viewContext
    }()
    
    
=======
    // lazy - создается только огда когда к свойству обращаются
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
>>>>>>> main
    var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoApp")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error)
            }
        }
<<<<<<< HEAD
        
=======
>>>>>>> main
        return container
    }()
    
    func save() {
        guard managedContext.hasChanges else { return }
<<<<<<< HEAD
        do {
            try managedContext.save()
        } catch {
            print("I can't save it \(error) ")
        }
        
=======
        
        do {
            try managedContext.save()
        } catch {
            print("I can't save it!!! \(error.localizedDescription)")
        }
>>>>>>> main
    }
}
