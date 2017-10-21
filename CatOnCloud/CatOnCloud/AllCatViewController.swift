//
//  AddCatViewController.swift
//  CatOnCloud
//
//  Created by irene on 10/21/17.
//  Copyright © 2017 irene. All rights reserved.
//

import UIKit

class AllCatViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    var cat: Cat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCat()
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func loadCat() {
        
        
       self.nameLabel.text=cat.name
       self.nameTextView.text=cat.description
       self.photoImageView.image=cat.photo
        
    }

  
    
}
