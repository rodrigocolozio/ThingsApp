//
//  NotesViewController.swift
//  Things-app
//
//  Created by Rodrigo Colozio on 07/03/23.
//

import UIKit

class NotesViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var notesTextField: UITextView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func addNoteButton(_ sender: Any) {
        
        guard let note = notesTextField?.text else {return}
        
        let myNote = Note(note: note)
        
        print("user add a note")
        
        
        
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
