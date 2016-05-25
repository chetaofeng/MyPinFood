//
//  ResturantTVController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantTVController: UITableViewController {
    var resturants = [
        ResutrantStruct(name:"咖啡胡同",type:"咖啡 & 茶店",location:"香港上环德普道西78号G／F",image:"cafedeadend.jpg",isHasVisited:true),
        ResutrantStruct(name:"霍米",type:"咖啡",location:"香港",image:"homei.jpg",isHasVisited:true),
        ResutrantStruct(name:"茶.家",type:"茶屋",location:"香港",image:"teakha.jpg",isHasVisited:true),
        ResutrantStruct(name:"洛伊斯咖啡",type:"奥地利式 & 休闲饮料",location:"香港",image:"cafeloisl.jpg",isHasVisited:true),
        ResutrantStruct(name:"贝蒂生蚝",type:"法式",location:"香港",image:"petiteoyster.jpg",isHasVisited:true),
        ResutrantStruct(name:"福奇餐馆",type:"面包房",location:"香港",image:"forkeerestaurant.jpg",isHasVisited:true),
        ResutrantStruct(name:"阿波画室",type:"面包房",location:"香港",image:"posatelier.jpg",isHasVisited:true),
        ResutrantStruct(name:"伯克街面包坊",type:"巧克力",location:"悉尼",image:"bourkestreetbakery.jpg",isHasVisited:true),
        ResutrantStruct(name:"黑氏巧克力",type:"咖啡",location:"悉尼",image:"haighschocolate.jpg",isHasVisited:true),
        ResutrantStruct(name:"惠灵顿雪梨",type:"美式 & 海鲜",location:"悉尼",image:"palominoespresso.jpg",isHasVisited:true),
        ResutrantStruct(name:"北州",type:"美式",location:"纽约",image:"upstate.jpg",isHasVisited:true),
        ResutrantStruct(name:"布鲁克林塔菲",type:"美式",location:"纽约",image:"traif.jpg",isHasVisited:true),
        ResutrantStruct(name:"格雷厄姆大街肉",type:"早餐 & 早午餐",location:"纽约",image:"grahamavenuemeats.jpg",isHasVisited:true),
        ResutrantStruct(name:"华夫饼 & 沃夫",type:"法式 & 茶",location:"纽约",image:"wafflewolf.jpg",isHasVisited:true),
        ResutrantStruct(name:"五叶",type:"咖啡 & 茶",location:"纽约",image:"fiveleaves.jpg",isHasVisited:true),
        ResutrantStruct(name:"眼光咖啡",type:"拉丁美式",location:"纽约",image:"cafelore.jpg",isHasVisited:true),
        ResutrantStruct(name:"忏悔",type:"西班牙式",location:"纽约",image:"confessional.jpg",isHasVisited:true),
        ResutrantStruct(name:"巴拉菲娜",type:"西班牙式",location:"伦敦",image:"barrafina.jpg",isHasVisited:true),
        ResutrantStruct(name:"多尼西亚",type:"西班牙式",location:"伦敦",image:"donostia.jpg",isHasVisited:true),
        ResutrantStruct(name:"皇家橡树",type:"英式",location:"伦敦",image:"royaloak.jpg",isHasVisited:true),
        ResutrantStruct(name:"泰咖啡",type:"泰式",location:"伦敦",image:"thaicafe.jpg",isHasVisited:true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil) //更改返回按钮样式
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
        
        cell.resturantImg.image = UIImage(named: resturants[indexPath.row].image)
        cell.resturantName.text = resturants[indexPath.row].name
        cell.resturantPlace.text = resturants[indexPath.row].location
        cell.resturantType.text = resturants[indexPath.row].type
//        cell.accessoryType = hasVisitedFlag[indexPath.row] ? .Checkmark: .None
        
        cell.hasVisitedImg.image = UIImage(named: "heart")
        cell.hasVisitedImg.hidden = resturants[indexPath.row].isHasVisited
        
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
            destVC.resturantImageName = resturants[(tableView.indexPathForSelectedRow?.row)!].image
            destVC.resturantStruct = resturants[(tableView.indexPathForSelectedRow?.row)!]
        }else if segue.identifier == "showNewResturantDetail"{
            let destVC = segue.destinationViewController as! ResturantDetailTVController
            destVC.resturantStruct = resturants[(tableView.indexPathForSelectedRow?.row)!]
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
