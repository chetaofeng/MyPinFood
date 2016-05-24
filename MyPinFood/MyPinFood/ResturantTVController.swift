//
//  ResturantTVController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantTVController: UITableViewController {
    var resturants = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var resturantsImages =
        ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var resturantsPlace = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var resturantsType = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
    
    var hasVisitedFlag = [Bool](count:21,repeatedValue:true)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.resturantImg.image = UIImage(named: resturantsImages[indexPath.row])
        cell.resturantName.text = resturants[indexPath.row]
        cell.resturantPlace.text = resturantsPlace[indexPath.row]
        cell.resturantType.text = resturantsType[indexPath.row]
//        cell.accessoryType = hasVisitedFlag[indexPath.row] ? .Checkmark: .None
        
        cell.hasVisitedImg.image = UIImage(named: "heart")
        cell.hasVisitedImg.hidden = hasVisitedFlag[indexPath.row]
        
        //设置图片的圆角效果
        cell.resturantImg.layer.cornerRadius = cell.resturantImg.frame.size.width / 2
        cell.resturantImg.clipsToBounds = true  //让圆角设置效果生效
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            resturants.removeAtIndex(indexPath.row)
            resturantsType.removeAtIndex(indexPath.row)
            resturantsPlace.removeAtIndex(indexPath.row)
            resturantsImages.removeAtIndex(indexPath.row)
            hasVisitedFlag.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade) //删除一行，同时有动画效果
//            tableView.reloadData() //刷新表格,刷新整个表格，不推荐
        } else if editingStyle == .Insert {
        
        }
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let doShare = UITableViewRowAction(style: .Default, title: "分享") { (action, indexPath) in
            let alertController = UIAlertController(title: "分享到", message: "请选择要分享到...", preferredStyle: .ActionSheet)
            let qqAction = UIAlertAction(title: "QQ", style: .Default, handler: nil)
            let sinaAction = UIAlertAction(title: "新浪", style: .Default, handler: nil)
            let wxAction = UIAlertAction(title: "微信", style: .Default, handler: nil)
            
            alertController.addAction(qqAction)
            alertController.addAction(sinaAction)
            alertController.addAction(wxAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        doShare.backgroundColor = UIColor.greenColor()

        let doDelete = UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) in
            self.resturants.removeAtIndex(indexPath.row)
            self.resturantsType.removeAtIndex(indexPath.row)
            self.resturantsPlace.removeAtIndex(indexPath.row)
            self.resturantsImages.removeAtIndex(indexPath.row)
            self.hasVisitedFlag.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade) //删除一行，同时有动画效果
        }

        return [doShare,doDelete]
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
 

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
     */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResturantDetail"{
            let destVC = segue.destinationViewController as! ResturantDetalViewController
            destVC.resturantImageName = resturantsImages[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
 
    
    /*
    //选中行后的事件
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alertController = UIAlertController(title: "你选择了本餐厅", message: "提示", preferredStyle:.ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel,handler: nil)
        
        let doDial = {(action:UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "您所拨打的号码暂时无法接通！", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        let dialAction = UIAlertAction(title: "拨打 0931-852960\(indexPath.row)", style: .Default,handler: doDial)
        
        let hasVisitedAction = UIAlertAction(title: "我来过", style: .Default) { (_) in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
//            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            cell.hasVisitedImg.hidden = false
            self.hasVisitedFlag[indexPath.row] = true
        }
     
        alertController.addAction(cancelAction)
        alertController.addAction(dialAction)
        alertController.addAction(hasVisitedAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
 */

    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
