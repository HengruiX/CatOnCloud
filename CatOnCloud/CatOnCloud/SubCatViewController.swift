//
//  SubCatViewController.swift
//  CatOnCloud
//
//  Created by irene on 10/21/17.
//  Copyright © 2017 irene. All rights reserved.
//

import UIKit

class SubCatViewController: UIViewController {
    
    @IBOutlet weak var CatName: UILabel!
    @IBOutlet weak var nameDescription: UITextView!
    @IBOutlet weak var nameGallery: UILabel!
    @IBOutlet weak var preTableView: UITableView!
    @IBOutlet weak var nameButton: UIButton!
    var images: [UIImage] = []
    var cat:Cat!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "previewcell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CatPreviewTableViewCell
        // Fetches the appropriate meal for the data source layout.
        cell?.cellImageView.image = images[indexPath.row]
        return cell!
    }
    
  
    
    
    
    
}
