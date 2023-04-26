//
//  Alerts.swift
//  Things-app
//
//  Created by Rodrigo Colozio on 09/03/23.
//

import UIKit

class Alerts {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func show (title: String = "Error", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(button)
        controller.present(alert, animated: true, completion: nil)
    }
}
