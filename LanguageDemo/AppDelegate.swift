//
//  AppDelegate.swift
//  LanguageDemo
//
//  Created by Rakesh Kumar on 01/04/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Get selected language if already there, otherwise check preferred languages on basis of locale if available then set to default language else english
        
        if let selectedLanguage = RKLocalization.sharedInstance.getLanguage(){
            RKLocalization.sharedInstance.setLanguage(language: selectedLanguage)
        }else{
            let languageCode = Locale.preferredLanguages[0]
            if Languages.isLanguageAvailable(languageCode){
                RKLocalization.sharedInstance.setLanguage(language: languageCode)
            }else{
                RKLocalization.sharedInstance.setLanguage(language: "en")
            }
        }
        self.initRootView()
        
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
    }


    func initRootView(){
        
        // set appearance of component on basis of language direction
        let dir = RKLocalization().getlanguageDirection()
        if  dir == .leftToRight {
            let semantic: UISemanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = semantic
            UIView.appearance().semanticContentAttribute = semantic
            UINavigationBar.appearance().semanticContentAttribute = semantic
        }
        else {
            let semantic: UISemanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = semantic
            UIView.appearance().semanticContentAttribute = semantic
            UINavigationBar.appearance().semanticContentAttribute = semantic
        }
        
        // init root controller of application and setting it to window
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let rootController: UINavigationController? = storyboard.instantiateViewController(withIdentifier: "appNavigationController") as? UINavigationController
        
        window?.rootViewController = rootController
    }
    
}

