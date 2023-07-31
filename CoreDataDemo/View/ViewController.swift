//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Shridevi Sawant on 21/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Strong reference to VM
    let empViewModel = EmployeeVM()

    @IBOutlet weak var tbl: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(NSHomeDirectory())
        
        // target-action pattern
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addClicked))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortClicked))
        
        tbl.dataSource = self
        tbl.delegate = self
        
        
    }
    
    @IBAction func filterClicked(_ sender: Any) {
       
        if empViewModel.getEmpByCity(city: "Pune"){
            
            
            tbl.reloadData()
        }
        else {
            showAlert(title: "ERROR", msg: "Filtering failed..")
        }
        
        
    }
    @objc
    func sortClicked(){
//        empList = empList.sorted { emp1, emp2 in
//            return emp1.salary > emp2.salary
//        }
        if empViewModel.getEmpSortedBySalary(){
            tbl.reloadData()
        }else {
            showAlert(title: "ERROR", msg: "Sorting failed")
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if empViewModel.getAllEmployees() {
            
            tbl.reloadData()
        }
        else {
            showAlert(title: "ERROR", msg: "Could not get list; try later")
        }
    }

    @objc func addClicked(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "addempvc")
        
        show(vc!, sender: self)
        
    }

}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let empToUpdate = empViewModel.empList[indexPath.row]
        
        let updateAction = UIContextualAction(style: .normal, title: "Add Bonus") { _, _, _ in
            
            if   self.empViewModel.updateSalary(index: indexPath.row, bonus: 1000){
                self.empViewModel.empList[indexPath.row] = empToUpdate
                self.tbl.reloadRows(at: [indexPath], with: .automatic)
               
                
                self.showAlert(title: "Salary updated", msg: nil)
            }else {
                self.showAlert(title: "Salary not updated", msg: nil)
            }
        }
       return UISwipeActionsConfiguration(actions: [updateAction])
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let empToDelete = empViewModel.empList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            if self.empViewModel.deleteEmployee(index: indexPath.row) {
                
                self.tbl.deleteRows(at: [indexPath], with: .automatic)
                
                self.showAlert(title: "Emp deleted", msg: nil)
            }else {
                self.showAlert(title: "Emp not deleted", msg: nil )
            }
        }
       return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empViewModel.empList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. create cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // data binding
        
        let emp = empViewModel.empList[indexPath.row]
        cell.textLabel?.text = "\(emp.name ?? ""), \t \(emp.city ?? "")"
        cell.detailTextLabel?.text = "ID: \(emp.empId), salary: \(emp.salary)"
        
        return cell
    }
    
    
}
