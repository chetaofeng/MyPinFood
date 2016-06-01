//
//  ResturantTVController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit
import CoreData

class ResturantTVController: UITableViewController,NSFetchedResultsControllerDelegate ,UISearchResultsUpdating{
    var resturants:[ResturantEntity] = [] //用于保存餐馆列表信息
    var frc:NSFetchedResultsController! //获取CoreData 数据的代理变量
    var sc:UISearchController!
    var searchResults:[ResturantEntity] = [] //用于保存搜索结果
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil) //更改返回按钮样式
        
        let request = NSFetchRequest(entityName: "ResturantEntity")
        let sd = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sd]
        let buffer = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: buffer, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        do{
          try frc.performFetch()
            resturants = frc.fetchedObjects as! [ResturantEntity]
        }catch{
            print(error)
        }
        
        sc = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = sc.searchBar    //设置搜索条的出现在页眉位置
        sc.searchResultsUpdater = self
        sc.dimsBackgroundDuringPresentation = false  //搜索时背景是否变暗
        sc.searchBar.placeholder = "请输入餐馆名。。。"
    }
    
    //在界面即将显示之前调用页面导航
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if !userDefaults.boolForKey("showedGuide") {
            if let guidePageVC = storyboard?.instantiateViewControllerWithIdentifier("guideController")  as? GuidePageViewController {
                presentViewController(guidePageVC, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sc.active ? searchResults.count : resturants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        let r = sc.active ? searchResults[indexPath.row] : resturants[indexPath.row]
        
        cell.resturantImg.image = UIImage(data: r.image!)
        cell.resturantName.text = r.name
        cell.resturantPlace.text = r.location
        cell.resturantType.text = r.type
//        cell.accessoryType = hasVisitedFlag[indexPath.row] ? .Checkmark: .None
        
        cell.hasVisitedImg.image = UIImage(named: "heart")
        cell.hasVisitedImg.hidden = r.isHasVisited!.boolValue
        
        //设置图片的圆角效果
        cell.resturantImg.layer.cornerRadius = cell.resturantImg.frame.size.width / 2
        cell.resturantImg.clipsToBounds = true  //让圆角设置效果生效
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return !sc.active   //搜索时不可编辑
    }

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
//            self.resturants.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade) //删除一行，同时有动画效果
            
            //从CoreData中删除
            let buffer = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
            let resturantToDel = self.frc.objectAtIndexPath(indexPath) as! ResturantEntity
            buffer.deleteObject(resturantToDel)
            do{
                try buffer.save()
            }catch{
                print(error)
            }
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
//            destVC.resturantImageName = resturants[(tableView.indexPathForSelectedRow?.row)!].image
//            destVC.hidesBottomBarWhenPushed = true //以代码方式隐藏TabBar
            destVC.resutrantEntity = sc.active ? searchResults[(tableView.indexPathForSelectedRow?.row)!] : resturants[(tableView.indexPathForSelectedRow?.row)!]
        }else if segue.identifier == "showNewResturantDetail"{
            let destVC = segue.destinationViewController as! ResturantDetailTVController
            destVC.resutrantEntity =  sc.active ? searchResults[(tableView.indexPathForSelectedRow?.row)!] : resturants[(tableView.indexPathForSelectedRow?.row)!]
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
    
    //新增餐馆的反向转场处理
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue){
        
    }
    
    // ------------------- CoreData的代理方法 --------------------
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _indexPath = newIndexPath {  //检测newIndexPath是否存在
                tableView.insertRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Move:
             tableView.reloadData()
        default:
            tableView.reloadData()  //重新加载列表
        }
        
        resturants = controller.fetchedObjects as! [ResturantEntity]
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    
    //------------------- 搜索条 --------------------
    func searchFun(textToSearch:String){
        searchResults = resturants.filter({ (r) -> Bool in
            return (r.name?.containsString(textToSearch))!
        })
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let textToSearch = sc.searchBar.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) {
            searchFun(textToSearch)
            tableView.reloadData()
        }
    }
}
