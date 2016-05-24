//
//  TableViewDemoController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class TableViewDemoController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var resturants = ["香辣麻辣烫"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReusedCell",forIndexPath: indexPath)
        
        cell.textLabel?.text = resturants[indexPath.row]
        cell.imageView?.image = UIImage(named: "restaurant")//此处的ImageView是IOS隐含自带的，在预览界面是看不见的
        
        return cell
    }
    
    //隐藏上方状态条
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
