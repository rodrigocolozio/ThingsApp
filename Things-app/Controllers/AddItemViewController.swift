//
//  AddItemViewController.swift
//  Things-app
//
//  Created by Rodrigo Colozio on 06/03/23.
//

import UIKit

protocol AddAnItemDelegate {
    func add(_ thing: Item)
}

class AddItemViewController: UIViewController, UITableViewDelegate {
    
    
    // MARK: - Atributos
    var delegate: MainController?
    
    
    //MARK: - IBOutlets
    @IBOutlet var thingTextField: UITextField?
    
    
    
    
    // MARK: - Method
    
    func dataFromUser() -> Item? {
        guard let text = thingTextField?.text else {
            return nil
        }
        
        let addItem = Item(nome: text)
        
        return addItem
        
    }
    
    // MARK: - IBActions
    @IBAction func AddToTable(_ sender: Any) {
        if let addItem = dataFromUser(){
            delegate?.add(addItem)
            navigationController?.popViewController(animated: true)
        } else {
            Alerts(controller: self).show(message: "Could not ready your data")
        }
    }
}
