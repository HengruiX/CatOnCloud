//
//  SubCatTableTableViewController.swift
//  CatOnCloud
//
//  Created by irene on 10/21/17.
//  Copyright © 2017 irene. All rights reserved.
//

import UIKit

class MyCatTableTableViewController: UITableViewController {
    
    //MARK: Properties
    var cats = [ Cat ]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MyCatTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyCatTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MyCatTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let cat = cats[indexPath.row]
        
        cell.nameLabel.text = cat.name
        cell.photoImageView.image = cat.photo
        cell.nameDescription.text = cat.description
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue3",
            let nextScene = segue.destination as? MyCatViewController ,
            let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedVehicle = cats[indexPath.row]
            nextScene.cat = selectedVehicle
            
            
        }
    }
    
}
