//
//  AllCatTableViewController.swift
//  CatOnCloud
//
//  Created by irene on 10/21/17.
//  Copyright © 2017 irene. All rights reserved.
//

import UIKit
import Alamofire

class AllCatTableViewController: UITableViewController{
    
    //MARK: Properties
    var cats = [ Cat ]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleCats()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cellIdentifier = "AllCatTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AllCatTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let cat = cats[indexPath.row]
        
        cell.nameLabel.text = cat.name
        cell.photoImageView.image = cat.photo
        cell.nameTextView.text = cat.description
        
        return cell
    }
    
    
   
    private func loadSampleCats() {
        
        let photo1 = UIImage(named: "cat1")
        let photo2 = UIImage(named: "cat2")
        let photo3 = UIImage(named: "cat3")
        
        guard let cat1 = Cat(name: "Cat1 ", photo: photo1, description: " ") else {
            fatalError("Unable to instantiate cat1")
        }
        
        guard let cat2 = Cat(name: "Cat2 ", photo: photo2, description: " ") else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let cat3 = Cat(name: "Cat3 ", photo: photo3, description: " ") else {
            fatalError("Unable to instantiate meal2")
        }
        
        cats += [cat1, cat2, cat3]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue1",
            let nextScene = segue.destination as? AllCatViewController ,
            let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedVehicle = cats[indexPath.row]
            nextScene.cat = selectedVehicle
        
        }
    }
    
}
