//
//  ResturantDetailTVController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/25.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class ResturantDetailTVController: UITableViewController {

    var resturantStruct:ResutrantStruct!
    @IBOutlet weak var resturantImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resturantImageView.image = UIImage(named: resturantStruct.image)
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
            cell.valueLabel.text = resturantStruct.name
        case 1:
            cell.fieldLabel.text = "类型"
            cell.valueLabel.text = resturantStruct.type
        case 2:
            cell.fieldLabel.text = "地址"
            cell.valueLabel.text = resturantStruct.location
        case 3:
            cell.fieldLabel.text = "是否来过"
            cell.valueLabel.text = resturantStruct.isHasVisited ? "来过" : "没来过"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
