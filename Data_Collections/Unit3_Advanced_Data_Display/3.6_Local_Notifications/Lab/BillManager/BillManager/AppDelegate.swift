//
//  AppDelegate.swift
//  BillManager
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    private let remindAgainActionID = "remindAgain"
    private let markAsPaidActionID = "markAsPaid"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        
        let remindAgainAction = UNNotificationAction(identifier: remindAgainActionID, title: "Remind again in an hour", options: [])
        let markAsPaidAction = UNNotificationAction(identifier: markAsPaidActionID, title: "Make as paid", options: [.authenticationRequired])
        
        let billCategory = UNNotificationCategory(identifier: Bill.notificationCategoryID, actions: [remindAgainAction, markAsPaidAction], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([billCategory])
        center.delegate = self
        
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
    
    // MARK: UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let notificationID = response.notification.request.identifier
        
        guard var bill = Database.shared.getBill(forNotificationID: notificationID) else {
            completionHandler()
            return
        }
        
        if response.actionIdentifier == remindAgainActionID {
            let snoozeDate = Date().addingTimeInterval(1 * 60 * 60) // 1 hour
            bill.schedule(snoozeDate) { bill in
                Database.shared.updateAndSave(bill)
            }
        } else if response.actionIdentifier == markAsPaidActionID {
            bill.paidDate = Date()
            Database.shared.updateAndSave(bill)
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .sound])
    }
}

