//
//  AboutTableViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/6/1.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    var sectionTitle = ["评分和反馈","关注我们"]
    var sectionContent = [["在AppStore上给我们评分","反馈意见"],["网站","微信","花川学院"]]
    var links = ["http://huachuanxueyuan.com/user/1","https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1464801224&di=375620193331abce49661fb5d1059d99&src=http://cdn.duitang.com/uploads/item/201508/24/20150824150620_FiVQ3.jpeg","http://hcxy.me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                if let url = NSURL(string: "http://apple.com/itunes/charts/paid-apps/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }else{
                performSegueWithIdentifier("showWebView", sender: self)
            }
        case 1:
            if let url = NSURL(string: links[indexPath.row]) {
                let sfVC = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                presentViewController(sfVC, animated: true, completion: nil)
            }
        default:
            break;
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
