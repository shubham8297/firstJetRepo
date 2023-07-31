//
//  EmployeeVM.swift
//  CoreDataDemo
//
//  Created by Shridevi Sawant on 27/07/23.
//

import Foundation

class EmployeeVM {
    // strong reference to Model, no reference to ViewController
    
    private let empUtiltity = EmpUtility.instance
    var empList: [Employee] = []
    
    func addEmployee(name:String, id: Int, city: String, salary: Int) -> Bool {
        
        do {
            try empUtiltity.addEmployee(name: name, id: id, city: city, salary: salary)
            
            return true
        }catch {
            return false
        }
    }
    
    func updateSalary(index: Int, bonus: Int) -> Bool {
        do {
            try empUtiltity.updateSalary(emp: empList[index], bonus: bonus)
            return true
        }catch {
            return false
        }
    }
    
    func getAllEmployees() -> Bool  {
    
        if let empArray = try? empUtiltity.getAllEmp() {
            self.empList = empArray
            return true
        }
        
        return false
 
    }
    
    func getEmpByCity(city: String) -> Bool {
        
        if let empArray = try? empUtiltity.getEmpByCity(city: city) {
            self.empList = empArray
            return true
        }
        
        return false
    }
    
    func getEmpSortedBySalary() -> Bool {
        
        if let empArray = try? empUtiltity.getEmpSortBySalary(){
            self.empList = empArray
            return true
        }
        
        return false
    }
    
    func deleteEmployee(index: Int) -> Bool {
        do {
            try empUtiltity.deleteEmployee(emp: empList[index])
            empList.remove(at: index)
            return true
        }catch {
            return false
        }
        
    }
    
}
