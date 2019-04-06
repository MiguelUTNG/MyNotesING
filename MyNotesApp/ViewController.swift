//
//  AppDelegate.swift
//  MyNotesApp
//
//  Created by Mike
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noteTitle: UITextField!
    
    @IBOutlet weak var sonucLabel: UILabel!
    @IBOutlet weak var noteDes: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var editNotes:MyNotes?
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 5
        noteDes.layer.cornerRadius = 10
        if let note = editNotes {
            noteTitle.text = note.title
            noteDes.text = note.details
        }
       
    }
  


    @IBAction func savebutton_click(_ sender: Any) {
        
        var newNote:MyNotes?
        if let note = editNotes {
            newNote = note
        }else{
        newNote = MyNotes(context: context)
        }
        newNote?.title = noteTitle.text
        newNote?.details = noteDes.text
        newNote?.date = NSDate() as Date
        do
        {
            ad.saveContext()
            noteTitle.text = ""
            noteDes.text = ""
        } catch {
            print("cannot error")
        }
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

