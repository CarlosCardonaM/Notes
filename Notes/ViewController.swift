//
//  ViewController.swift
//  Notes
//
//  Created by Carlos Cardona on 15/05/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UITableView!
    
    var models: [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
        title = "Notes"
    }
    
    @IBAction func didTapNewNote() {
        guard  let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.label?.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)

    }
    
    // Table Stuff:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

