//
//  AppDelegate.swift
//  SwiftUI_DeepLink_tutorial
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // @State var selectedTab = 0
    // 따로 AppDelegate 역할을 하는 파일을 가지게 된다면
    // TabView(selection: $selectedTab,
    //         content: {
    //              Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
    //              Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2) })



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

