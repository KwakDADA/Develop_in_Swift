//
//  Alarm.swift
//  Alarm
//
//  Created by 곽다은 on 6/4/24.
//  Copyright © 2024 AppDev Training. All rights reserved.
//

import UserNotifications
import Foundation

struct Alarm {
    static let notificationCategoryID = "AlarmNotification"
    static let snoozeActionID = "snooze"
    private var notificationID: String
    
    var date: Date
    
    init(date: Date, notificationID: String? = nil) {
        self.notificationID = notificationID ?? UUID().uuidString
        self.date = date
    }
    
    func schedule(completion: @escaping (Bool) -> ()) {
        authorizeIfNeeded { granted in
            guard granted else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Alarm"
            content.body = "Beep Beep"
            content.sound = UNNotificationSound.default
            content.categoryIdentifier = Alarm.notificationCategoryID
            
            let triggerDateComponents = Calendar.current.dateComponents([.minute, .hour, .day, .month, .year], from: self.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: self.notificationID, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error: Error?) in
                DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
        }
    }
    
    func unschedule() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationID])
    }
    
    /// this method should get the notification settings from the shared instance of UNUserNotificationCenter, then check the authorization status.
    private func authorizeIfNeeded(completion: @escaping (Bool) -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
                
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, _ in // .alert가 .list와 .banner로 변경되었습니다.
                    completion(granted)
                }
                
            case .denied, .provisional, .ephemeral:
                completion(false)
                
            @unknown default:
                completion(false)
            }
        }
    }
}
