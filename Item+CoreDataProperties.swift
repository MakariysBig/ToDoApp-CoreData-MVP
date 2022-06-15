//
//  Item+CoreDataProperties.swift
//  ToDoApp
//
//  Created by User on 13.06.22.
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
