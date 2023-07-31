//
//  AddEmpVC.swift
//  CoreDataDemo
//
//  Created by Shridevi Sawant on 21/07/23.
//

import UIKit

class AddEmpVC: UIViewController {

    let empViewModel = EmployeeVM()
    
    @IBOutlet weak var salaryT: UITextField!
    @IBOutlet weak var idT: UITextField!
    @IBOutlet weak var cityT: UITextField!
    @IBOutlet weak var nameT: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addClick(_ sender: Any) {
        let name = nameT.text ?? ""
        let id = idT.text ?? ""
        let city = cityT.text ?? ""
        let salary =  salaryT.text ?? ""
        
        guard !name.isEmpty && !id.isEmpty && !city.isEmpty && !salary.isEmpty else {
            return
        }
        
        let empId = Int(id) ?? 0
        let sal = Int(salary) ?? 0
        
       if empViewModel.addEmployee(name: name, id: empId, city: city, salary: sal) {
            showAlert(title: "Employee added", msg: nil)
        }else {
            showAlert(title: "Error adding employee", msg: "May be duplicated emp Id")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
