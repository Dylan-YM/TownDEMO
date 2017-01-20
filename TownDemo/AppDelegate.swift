//
//  AppDelegate.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/6.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.frame = UIScreen.main.bounds
        let nav = UINavigationController()
        
        self.window?.rootViewController = nav
        
        let mainVC = MainViewController()
        
        nav.setViewControllers([mainVC], animated: true)
        self.window?.makeKeyAndVisible()
        
        setLaunchAnimotion()
        
        
        return true
    }
    func setLaunchAnimotion(){
//        let imgView = UIImageView(frame: (self.window?.bounds)!)
//        self.window?.addSubview(imgView)
//          imgView.image = UIImage(named: "intro3")
//        let imgView2 = UIImageView(frame: (self.window?.bounds)!)
//        self.window?.addSubview(imgView2)
//        imgView2.image = UIImage(named: "intro2")
//        let transition = CATransition()
//        transition.type = "kCATransitionFade"
//        transition.subtype = "kCATransitionFromLeft"
//        transition.duration = 1.5;
//        imgView.image = UIImage.init(named: "intro2")
//        imgView.layer.add(transition, forKey: "transitionAni")
////
//      
        
  
    }
    func changeImageName(imageview:UIImageView){
    
    imageview.image = UIImage(named: "intro3")
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
    }


}

