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
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style:.Light))
        blurEffectView.frame = view.frame
        backResutrantImage.addSubview(blurEffectView)
        
        //先设置stackview的大小为0
        let scale = CGAffineTransformMakeScale(0, 0) //缩放
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        stackView.transform = scale
        stackView.transform = translate
    }
    
    //界面显示的时候添加动画效果
    override func viewDidAppear(animated: Bool) {
//        //在设置补帧效果
//        UIView.animateWithDuration(1) {
//            self.stackView.transform = CGAffineTransformIdentity //1s之后到尾帧
//        }
        
        //设置补帧效果二
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
             self.stackView.transform = CGAffineTransformIdentity //1s之后到尾帧
            }, completion: nil)
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
