//
//  ToDoListItem+CoreDataProperties.swift
//  CoreDataToDoList
//
//  Created by Harold Davidson on 2/7/25.
//
//

import Foundation
import CoreData

// this was created from going to CoreDataToDoList file and going Editor > Create NSManagedObject Subclass...
extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListItem : Identifiable {

}
