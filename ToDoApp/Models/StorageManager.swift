import Foundation
import CoreData

class StorageManager {
    
    let coreDataStack = CoreDataStack()
    
    var items: [Item] = []
    
    func getItems(closure: @escaping(Result<[Item], Error>) -> Void) {
        let context = coreDataStack.managedContext
        let fetchRequest = Item.fetchRequest()
        
        do {
            items = try context.fetch(fetchRequest)
            closure(.success(items))
        } catch {
            closure(.failure(error))
        }
    }
    
    func saveItem(with name: String, completion: @escaping(Result<Item, Error>) -> Void) {
        let context = coreDataStack.managedContext
        
        let item = Item(context: context)
        item.name = name
    
        coreDataStack.save()
        
        completion(.success(item))
             
    }
}
    
    
    

