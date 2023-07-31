//
//  Utility.swift
//  CoreDataDemo
//
//  Created by Shridevi Sawant on 27/07/23.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(title: String?, msg: String?){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertVC.addAction(okAction)
        present(alertVC, animated: false)
    }
}
