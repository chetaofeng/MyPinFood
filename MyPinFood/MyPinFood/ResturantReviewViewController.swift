//
//  ResturantReviewViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/26.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantReviewViewController: UIViewController {

    @IBOutlet weak var backResutrantImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style:.Light))
        blurEffectView.frame = view.frame
        backResutrantImage.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
