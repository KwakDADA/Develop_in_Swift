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
    
    mutating func schedule(_ date: Date, completion: @escaping (Bill) -> ()) {
        var updatedBill = self
        
        updatedBill.unschedule()
        
        authorizeIfNeeded { granted in
            guard granted else {
                DispatchQueue.main.async {
                    completion(updatedBill)
                }
                return
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Bill Reminder"
        content.body = "$\(updatedBill.amount!) due to \(updatedBill.payee!) on \(updatedBill.formattedDueDate)"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = Bill.notificationCategoryID
        
        let triggerDateComponents = Calendar.current.dateComponents([.minute, .hour, .day, .month, .year], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)
        
        notificationID = UUID().uuidString
        remindDate = date
        
        let request = UNNotificationRequest(identifier: updatedBill.notificationID!, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                completion(updatedBill)
            }
        }
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
