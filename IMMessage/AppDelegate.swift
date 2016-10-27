//
//  AppDelegate.swift
//  IMMessage
//
//  Created by ZhongMing on 10/10/16.
//  Copyright © 2016 ZhongMing. All rights reserved.
//

import UIKit
import CoreData
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?

    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        print(userId)
        switch userId! {
        case "samzhong":
            userInfo.name = "sam"
            userInfo.portraitUri = "http://shinyswan.com/uploads/image/beauty1.jpg"
        case "Tianna":
            userInfo.name = "Tianna"
            userInfo.portraitUri = "http://shinyswan.com/uploads/image/beauty1.jpg"
        default:
            print("No Users")
        }
        return completion(userInfo)
    }
    
    func connectServer(completion:@escaping () -> Void){
        //Set up info provider
        RCIM.shared().userInfoDataSource = self
        
        //Initialize appkey
        
        RCIM.shared().initWithAppKey("0vnjpoadnpg1z")
        RCIM.shared().connect(withToken: "2WyO4HoQMbnj6EXZ9DwboWGsyzAVozDc5F9ECi9rmcakMSVTt945Ez5z0JELsr0Zia24J0p11apUJRQr2pWmJ3p4DDwICk/G",
                              success: { (str: String?) -> Void in
                                print("HI THERE!")
                                
                                let currentUser = RCUserInfo(userId: "samzhong", name: "sam", portrait: "http://shinyswan.com/uploads/image/beauty1.jpg")
                                RCIMClient.shared().currentUserInfo = currentUser
                                
                                
                                DispatchQueue.main.async(execute: { 
                                    completion()
                                })
                                //print("connect")
//                                print(currentUser!.userId)
//                                print(currentUser!.name)
                                
            },
                              error: { (_) -> Void in
                                print("error!")
            },
                              tokenIncorrect: { (_) -> Void in
                                print("failed!")
        })

    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //gps
        GMSServices.provideAPIKey("AIzaSyBIFXjvy8AMvQTygqHpHiIq8Y6o7vnlIdc")
        
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "IMMessage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

