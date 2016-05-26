//
//  AddResturantTableViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/26.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class AddResturantTableViewController: UITableViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var pickedImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //点击第一行弹出系统相册选择界面
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 { //仅响应第一行的点击事件
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){ //检测是否有访问权限
                let imagePickerController = UIImagePickerController()
                
                imagePickerController.delegate = self //设置相册选择视图的代理
                
                imagePickerController.allowsEditing = false     //不允许用户编辑
                imagePickerController.sourceType = .PhotoLibrary
                self.presentViewController(imagePickerController, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //处理相册选择图像完成后的操作
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        pickedImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        pickedImage.contentMode = .ScaleAspectFill
        pickedImage.clipsToBounds = true
        
        
        //用代码进行布局处理
        let leftCons = NSLayoutConstraint(item: pickedImage, attribute: .Leading, relatedBy: .Equal, toItem: pickedImage.superview, attribute: .Leading, multiplier: 1, constant: 0)
        let rightCons = NSLayoutConstraint(item: pickedImage, attribute: .Trailing, relatedBy: .Equal, toItem: pickedImage.superview, attribute: .Trailing, multiplier: 1, constant: 0)
        let topCons = NSLayoutConstraint(item: pickedImage, attribute: .Top, relatedBy: .Equal, toItem: pickedImage.superview, attribute: .Top, multiplier: 1, constant: 0)
        let bottomCons = NSLayoutConstraint(item: pickedImage, attribute: .Bottom, relatedBy: .Equal, toItem: pickedImage.superview, attribute: .Bottom, multiplier: 1, constant: 0)
        
        leftCons.active = true
        rightCons.active = true
        topCons.active = true
        bottomCons.active = true
        
        dismissViewControllerAnimated(true, completion: nil)    //让相册选择视图腿长
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
