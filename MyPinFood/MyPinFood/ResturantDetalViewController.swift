//
//  ResturantDetalViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/25.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantDetalViewController: UIViewController {
 
    var resutrantEntity:ResturantEntity!
    
    @IBOutlet weak var detailResutrantImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailResutrantImage.image = UIImage(data: resutrantEntity.image!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
