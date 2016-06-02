//
//  AppDelegate.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/21.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit
import CoreData

enum QuickAction : String{
    case OpenFav      = "openFavourite"
    case OpenDiscover = "openDiscover"
    case OpenAdd      = "openAddResturant"
    
    init(fullID:String){
        let shortID = fullID.componentsSeparatedByString(".").last!
        self.init(rawValue:shortID)!
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //更改导航条的样式
        UINavigationBar.appearance().barTintColor = UIColor(red: 242/255, green: 116/255, blue: 119/255, alpha: 1)  //导航条背景颜色
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()       //导航条的字的颜色
        //设置标题字体的属性
        if let font = UIFont(name: "Avenir-Light", size: 24){
            UINavigationBar.appearance().titleTextAttributes = [
                NSForegroundColorAttributeName:UIColor.whiteColor(),
                NSFontAttributeName:font
            ]
        }
        
        //设置顶部状态栏的颜色为亮色
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //定制TabBar的样式
        UITabBar.appearance().selectionIndicatorImage =  UIImage(named: "tabitem-selected")
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }

    // MARK: - Core Data stack
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        print(urls[urls.count-1])
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("MyFoodPin", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("MyPinFood.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    //-------------------- 3D Touch快捷操作的处理 --------------
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        completionHandler(handleQuickAction(shortcutItem))
    }
    func handleQuickAction(shortcutItem:UIApplicationShortcutItem) -> Bool{
        let type = shortcutItem.type
        let shortID = QuickAction(fullID: type)
        
        let tabVC = window?.rootViewController as? UITabBarController
        
        switch shortID {
        case .OpenFav:
            tabVC?.selectedIndex = 0
        case .OpenDiscover:
            tabVC?.selectedIndex = 2
        case .OpenAdd:
            let navVC = tabVC?.viewControllers?.first
            let tableVC = navVC?.childViewControllers.first
            tabVC?.performSegueWithIdentifier("addResturant", sender: tableVC)
        default:
            break
        }
        
        return true
    }
}

