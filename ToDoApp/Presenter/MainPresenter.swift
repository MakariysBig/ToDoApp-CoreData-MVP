import Foundation
import CoreData

class MainPresenter {
    let coreDataStack = CoreDataStack()
    
    weak var viewDelegate: MainViewDelegate?
    var items: [Item] = []
    
    //MARK: - Methods
    func getItems() {
        let context = coreDataStack.managedContext
        let fetchRequest = Item.fetchRequest()
        
        do {
            items = try context.fetch(fetchRequest)
        } catch {
            print("I can't fetch items")
        }
    }
    
    func save(with name: String) {
        let context = coreDataStack.managedContext
        
        let item = Item(context: context)
        item.name = name

        coreDataStack.save()
        
        items.append(item)
    }
}
