//
//  Bill+Extras.swift
//  BillManager
//

import Foundation
import NotificationCenter

extension Bill {
    static let notificationCategoryID = "BillNotification"
    static let remindAgainActionID = "remindAgain"
    static let markAsPaidActionID = "markAsPaid"
    
    var hasReminder: Bool {
        return (remindDate != nil)
    }
    
    var isPaid: Bool {
        return (paidDate != nil)
    }
    
    var formattedDueDate: String {
        let dateString: String
        
        if let dueDate = self.dueDate {
            dateString = dueDate.formatted(date: .numeric, time: .omitted)
        } else {
            dateString = ""
        }
        
        return dateString
    }
    
    func schedule(_ date: Date, completion: @escaping (Bool) -> ()) {
        
    }
    
    mutating func unschedule() {
        if let notificationID = notificationID {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationID])
        }
        notificationID = nil
        remindDate = nil
    }
    
    private func authorizeIfNeeded(completion: @escaping (Bool) -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, _ in
                    completion(granted)
                }
            case .denied, .provisional, .ephemeral:
                completion(false)
            case .authorized:
                completion(true)
            @unknown default:
                completion(false)
            }
        }
    }
}
