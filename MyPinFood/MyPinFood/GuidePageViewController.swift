//
//  GuidePageViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/6/1.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class GuidePageViewController: UIPageViewController,UIPageViewControllerDataSource {

    var headers = ["私人定制","餐馆定位","美食发现"]
    var images  = ["foodpin-intro-1","foodpin-intro-2","foodpin-intro-3"]
    var footers = ["好店随时加，打造自己的美食向导","马上找到美味大餐的位置","发现其它吃货的美食珍藏"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        //设置第一个页面
        if let startVC = viewControllerAtIndex(0) {
            setViewControllers([startVC], direction: .Forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //--------------------------Start  默认页码现实（无法修改样式）------
    /*
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return headers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    */
    //--------------------------End -----------------

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            var index = (viewController as! GuideContentViewController).index
            index += 1
            return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index:Int) -> GuideContentViewController? {
        if case 0 ..< headers.count = index {
            if let contentVC = storyboard?.instantiateViewControllerWithIdentifier("guideContentController") as? GuideContentViewController {
                contentVC.footer        = footers[index]
                contentVC.imageViewName = images[index]
                contentVC.header        = headers[index]
                contentVC.index         = index
                return contentVC
            }
        }
        
        return nil
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
