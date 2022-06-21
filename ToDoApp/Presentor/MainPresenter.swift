import Foundation
import CoreData

class MainPresenter {
    
    let storageManager = StorageManager()
    
    weak var viewDelegate: MainViewDelegate?
    
    func getItems() {
        storageManager.getItems { result in
            switch result {
            case .success(let items):
                self.storageManager.items = items
                self.viewDelegate?.getItems()
            case .failure(let error):
                self.viewDelegate?.showAlert(with: error.localizedDescription)
            }
        }
    }
    
    func saveItem(with text: String) {
        storageManager.saveItem(with: text) { result in
            switch result {
            case .success(let item):
                self.storageManager.items.append(item)
            case .failure(let error):
                self.viewDelegate?.showAlert(with: error.localizedDescription)
            }
        }
    }
}
