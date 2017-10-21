//
//  CatTableViewCell.swift
//  CatOnCloud
//
//  Created by irene on 10/21/17.
//  Copyright © 2017 irene. All rights reserved.
//

import UIKit
import Alamofire

class CatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
