//
//  EmpUtility.swift
//  CoreDataDemo
//
//  Created by Shridevi Sawant on 21/07/23.
//

import Foundation
import UIKit

struct EmpUtility {
    
    static var instance = EmpUtility()
    
    private let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){
        
    }
    
    func addEmployee(name:String, id: Int, city: String, salary: Int) throws {
        // insert
        
        let emp = Employee(context: dbContext)
        emp.name = name
        emp.empId = Int16(id)
        emp.city = city
        emp.salary = Int32(salary)
        
        try dbContext.save()
    }
    
    func deleteEmployee(emp: Employee) throws {
        // delete
        
        dbContext.delete(emp)
        
        try dbContext.save()
    }
    
    func getAllEmp() throws -> [Employee] {
        // select query
        
        let req = Employee.fetchRequest()
        
    
        return try dbContext.fetch(req)
    }
    
    func getEmpSortBySalary() throws -> [Employee]{
        
        let req = Employee.fetchRequest()
        
        let sortDescr = NSSortDescriptor(key: "salary", ascending: false)
        req.sortDescriptors = [sortDescr]
        
        return try dbContext.fetch(req)
    }
    
    func getEmpByCity(city: String) throws -> [Employee]{
        
        let req = Employee.fetchRequest()
        
        let sortDescr = NSSortDescriptor(key: "salary", ascending: false)
        req.sortDescriptors = [sortDescr]
        
  
        let pred = NSPredicate( format: "city == %@", argumentArray: [city])
        req.predicate = pred
        
        return try dbContext.fetch(req)
    }
    
    func updateSalary(emp: Employee, bonus: Int) throws {
        // update
        
        emp.salary += Int32(bonus)
        
        try dbContext.save()
    }
}

