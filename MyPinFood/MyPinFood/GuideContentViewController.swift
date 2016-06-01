//
//  GuideContentViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/6/1.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class GuideContentViewController: UIViewController {

    @IBOutlet weak var headerLB: UILabel!
    @IBOutlet weak var imageLB: UIImageView!
    @IBOutlet weak var footerLB: UILabel!
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var doneBtn: UIButton!

    var index         = 0
    var header        = ""
    var footer        = ""
    var imageViewName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLB.text = header
        footerLB.text = footer
        imageLB.image = UIImage(named: imageViewName)
        
        pageCtrl.currentPage = index
        if index == 2 { //最后一页的时候，显示立即体验按钮
            doneBtn.hidden = false
        }else{
            doneBtn.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: 页面Action处理
    @IBAction func dontBtnTapped(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "showedGuide")
        //隐藏以模态形式弹出的导航页面
        dismissViewControllerAnimated(true) { 
            
        }
    }
}
