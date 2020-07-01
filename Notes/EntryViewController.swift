//
//  EntryViewController.swift
//  Notes
//
//  Created by Carlos Cardona on 15/05/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapeSave))
    
    }
    
    @objc func didTapeSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text!.isEmpty {
            completion?(text, noteField.text!)
        }

    }
}
