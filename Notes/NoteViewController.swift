//
//  NoteViewController.swift
//  Notes
//
//  Created by Carlos Cardona on 15/05/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = noteTitle
        noteLabel.text = note
    }
    

}
