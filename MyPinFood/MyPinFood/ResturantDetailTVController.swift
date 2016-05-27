//
//  ResturantDetailTVController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/25.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantDetailTVController: UITableViewController {

    var resutrantEntity:ResturantEntity!
    @IBOutlet weak var resturantImageView: UIImageView!
    @IBOutlet weak var ratingBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = resutrantEntity.name    //设置视图标题
        
        resturantImageView.image = UIImage(data: resutrantEntity.image!)
        
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)  //设置表格背景颜色
        tableView.tableFooterView = UIView(frame:CGRectZero)        //移除空行
        tableView.separatorColor  = UIColor(white: 0.9, alpha: 1)   //更改分割线的颜色
        
        //设置单元格自适应高度  高度自适应之后，就需要添加其相对顶距和底距 
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! ResturantDetailTableViewCell
 
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "餐馆名"
            cell.valueLabel.text = resutrantEntity.name
        case 1:
            cell.fieldLabel.text = "类型"
            cell.valueLabel.text = resutrantEntity.type
        case 2:
            cell.fieldLabel.text = "地址"
            cell.valueLabel.text = resutrantEntity.location
        case 3:
            cell.fieldLabel.text = "是否来过"
            cell.valueLabel.text = resutrantEntity.isHasVisited!.boolValue ? "来过" : "没来过"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor() //设置单元格背景透明
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //转场到地图界面  同时传递参数
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destVC = segue.destinationViewController as! MapViewController
            destVC.resutrantEntity = self.resutrantEntity
        }
    }
    
    //设置顶部状态条的颜色
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.barStyle = .Black
    }
    
    //设置反向专场
    @IBAction func close(segue:UIStoryboardSegue){
        //反向专场的时候传递参数
        if let reviewVC = segue.sourceViewController as? ResturantReviewViewController{
            if let rating = reviewVC.rating{
                self.resutrantEntity.rating = rating
                self.ratingBtn.setImage(UIImage(named: rating), forState: .Normal)
            }
        }
    }

}
