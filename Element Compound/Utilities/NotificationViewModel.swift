//
//  NotificationViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/12/21.
//

import SwiftUI
import UserNotifications
import FirebaseMessaging

class NotificationViewModel: ObservableObject{
    @Published var permission: UNAuthorizationStatus?
    @AppStorage("subscribeToAllNotifcations") var subscribeToAllNotifcations: Bool = false {
        didSet {
            if subscribeToAllNotifcations {
                subscribeToAllTopics()
            } else {
                unsubscribeFromAllTopics()
            }
        }
    }
    
    
    func getNotificationSetting(){
        UNUserNotificationCenter.current().getNotificationSettings() { permission in
            DispatchQueue.main.async{
                self.permission = permission.authorizationStatus
            }
            if permission.authorizationStatus == .authorized {
                DispatchQueue.main.async{
                    UIApplication.shared.registerForRemoteNotifications()
                }
                
                if self.subscribeToAllNotifcations {
                    self.subscribeToAllTopics()
                } else {
                    self.unsubscribeFromAllTopics()
                }
               
            } else{
                DispatchQueue.main.async{
                    UIApplication.shared.unregisterForRemoteNotifications()
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                }
                self.unsubscribeFromAllTopics()
            }
        }
    }
    
    private func subscribeToAllTopics() {
        guard permission == .authorized else { return }
        
        Messaging.messaging().subscribe(toTopic: "all") { error in
            if let error = error {
                print("error while subscribing: ", error)
                return
            }
            print("Subscribed to notifications for all topics")
        }
    }
    
    private func unsubscribeFromAllTopics() {
        Messaging.messaging().unsubscribe(fromTopic: "all") { error in
            if let error = error {
                print("Error while unsubscribing: ", error)
                return
            }
            print("Unsubscribed from notifcations for all topics")
        }
    }
}
