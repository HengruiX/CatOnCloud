//
//  ImageHelper.swift
//  CatOnCloud
//
//  Created by Henry Xing on 21/10/2017.
//  Copyright © 2017 irene. All rights reserved.
//

import UIKit
import Alamofire

class ImageHelper: NSObject {
    func downloadImage(url:String, completion: @escaping (_ image: UIImage?) -> Void) {
        let remoteImageURL = URL(string: url)!
        Alamofire.request(remoteImageURL).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    completion(UIImage(data: data))
                }
            }
        }
    }
}
