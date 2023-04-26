//
//  ViewController.swift
//  Things-app
//
//  Created by Rodrigo Colozio on 06/03/23.
//

import UIKit

class MainController: UIViewController, UITableViewDataSource, AddAnItemDelegate, UITableViewDelegate {
    
    
    // MARK: - Atributos
    var toDo: [Item] = []
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableTableView: UITableView!
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhasDaTable = indexPath.row
        let linha = toDo[linhasDaTable]
        cell.textLabel?.text = linha.nome


        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(removeThing))
        swipeGesture.direction = .left
        cell.addGestureRecognizer(swipeGesture)
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none

            let item = toDo[indexPath.row]
            if let position = toDo.firstIndex(of: item) {
            toDo.remove(at: position)
            tableTableView.reloadData()
            }
        }
        
    }
    
    
    // MARK: - Methods
    func add(_ thing: Item){
        toDo.append(thing)
        if let tableView = tableTableView{
            tableView.reloadData()
        } else {
            Alerts(controller: self).show(message: "We're having truble to add your ToDo")
        }
        
    }
    
    @objc func removeThing(_ gesture: UISwipeGestureRecognizer){
            
            print("Acctivate swipeGestures")
            
            let celula = gesture.view as! UITableViewCell
             
            guard let indexPath = tableTableView.indexPath(for: celula) else { return }
            
//            let position = toDo[indexPath.row]
        
//            let action =
            toDo.remove(at:indexPath.row)
        
            tableTableView.deleteRows(at: [indexPath], with: .fade)    }
    
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         if segue.identifier == "adicionar"{
             if let viewController = segue.destination as? AddItemViewController {
                 viewController.delegate = self
             }
         }
     }

    
    

}

