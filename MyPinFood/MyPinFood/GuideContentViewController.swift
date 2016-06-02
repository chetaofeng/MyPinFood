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
    @IBOutlet weak var footerLB: UILabel!
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var imageLB: UIImageView!

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
        
        //3D Touch的添加菜单
        if traitCollection.forceTouchCapability == .Available {
            let bundleID = NSBundle.mainBundle().bundleIdentifier
            
            let icon0 = UIApplicationShortcutIcon(templateImageName: "favorite")
            let item0 = UIApplicationShortcutItem(type: "\(bundleID).openFavourite", localizedTitle: "最爱", localizedSubtitle: nil, icon: icon0, userInfo: nil)
           
            let icon1 = UIApplicationShortcutIcon(templateImageName: "disover")
            let item1 = UIApplicationShortcutItem(type: "\(bundleID).openDiscover", localizedTitle: "发现", localizedSubtitle: nil, icon: icon1, userInfo: nil)
            
            let icon2 = UIApplicationShortcutIcon(type: .Add)
            let item2 = UIApplicationShortcutItem(type: "\(bundleID).openAddResturant", localizedTitle: "新店", localizedSubtitle: nil, icon: icon2, userInfo: nil)
            
            UIApplication.sharedApplication().shortcutItems = [item0,item1,item2]
        }
        
        dismissViewControllerAnimated(true, completion: nil)//隐藏以模态形式弹出的导航页面
    }
}
