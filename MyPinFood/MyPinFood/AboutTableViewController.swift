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
    var links = ["http://huachuanxueyuan.com/user/1","https://www.baidu.com/s?wd=儿童节&tn=SE_pshlcjsy_xef5bmh","http://hcxy.me"]
    
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
