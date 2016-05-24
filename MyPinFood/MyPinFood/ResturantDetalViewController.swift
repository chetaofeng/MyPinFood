//
//  ResturantDetalViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/25.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantDetalViewController: UIViewController {

    var resturantImageName:String = ""
    
    @IBOutlet weak var detailResutrantImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailResutrantImage.image = UIImage(named: resturantImageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
