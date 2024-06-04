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
    
    func schedule(completion: @escaping (Bool) -> ()) {
        
    }
    
    func unschedule() {
        
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
