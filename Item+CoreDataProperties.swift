//
//  Item+CoreDataProperties.swift
//  ToDoApp
//
<<<<<<< HEAD
//  Created by David Taniukevich on 13.06.22.
=======
//  Created by User on 13.06.22.
>>>>>>> main
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?

}

extension Item : Identifiable {

}
