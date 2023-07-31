//
//  Department+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Shridevi Sawant on 24/07/23.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int16
    @NSManaged public var toEmp: NSSet?

}

// MARK: Generated accessors for toEmp
extension Department {

    @objc(addToEmpObject:)
    @NSManaged public func addToToEmp(_ value: Employee)

    @objc(removeToEmpObject:)
    @NSManaged public func removeFromToEmp(_ value: Employee)

    @objc(addToEmp:)
    @NSManaged public func addToToEmp(_ values: NSSet)

    @objc(removeToEmp:)
    @NSManaged public func removeFromToEmp(_ values: NSSet)

}

extension Department : Identifiable {

}
