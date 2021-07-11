//
//  AnnouncementViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore
import Firebase

//class AnnoucnementViewModel: ObservableObject{
//    @Published var announcement: Announcement = Announcement(message: "", title: "",  photoURL:(Auth.auth().currentUser?.photoURL!)!,  sender: Auth.auth().currentUser?.displayName ?? "N/A",  color: Color.blue,  dateEvent: Date())
//    @Published var modified = false
//
//    let ReceiverFCMToken = "fWM1lZGSxEvZtPtfkf-sZF:APA91bFsRypqHw9QLFIy6hFoe-h4QPvo7yh7NWULa8QbYm3H_eG8kKd0KL6vA9A71HjCIFjd2YYuzkbUWSQh2CAMkYuLGnpzTKDdG8Jz7PAoN0TYsMP_Ti4IAHe1aVY7C-ghf0QRiSMo"
//    let legacyServerKey = "AAAAnjP38Rg:APA91bH6k0y3FhWBKdRImuwXyt_jgm5u-0HedjcfX30j_P6RJ5Pdc_-cGEZA_jjXUeXcLy39YO4MnIB4nWqFy9FGlrxUhdz5kVLhwdKWYMF7rtkjccrjPE_A2tXAV_9F0RK6SVUyAPmc"
//    @State private var fcmTokenMessage = "fcmTokenMessage"
//    @State private var instanceIDTokenMessage = "instanceIDTokenMessage"
//
//    private var db = Firestore.firestore()
//
//    private var cancellables = Set<AnyCancellable>()
//
//    init(announcement: Announcement = Announcement(message: "", title: "",  photoURL: (Auth.auth().currentUser?.photoURL!)!,  sender: Auth.auth().currentUser?.displayName ?? "N/A",  color: Color.blue,  dateEvent: Date()
//)) {
//        self.announcement = announcement
//        self.$announcement
//            .dropFirst()
//            .sink{ [weak self] announcement in
//                self?.modified = true
//            }
//            .store(in: &cancellables)
//    }
//
//    func addAnnouncement(announcement: Announcement){
//        do {
//          let _ =  try db.collection("announcements").addDocument(from: announcement)
//        }
//        catch{
//            print(error)
//        }
//    }
//
//    func save() {
//        addAnnouncement(announcement: announcement)
//    }

    
    
 

    class AnnoucnementViewModel: ObservableObject {
      // MARK: - Public properties
      
      @Published var announcement: Announcement
      @Published var modified = false
       

      
      // MARK: - Internal properties
      
      private var cancellables = Set<AnyCancellable>()
      
      // MARK: - Constructors
      
        init(announcement: Announcement = Announcement(message: "", title: "", /*color: Color.blue,*/  photoURL:(Auth.auth().currentUser?.photoURL!)!,  sender: Auth.auth().currentUser?.displayName ?? "N/A",  dateEvent: Date())) {
                self.announcement = announcement
    //
                self.$announcement
                .dropFirst()
                .sink { [weak self] announcement in
                  self?.modified = true
                }
                .store(in: &self.cancellables)
             
            }
            
      
        
    //    //MARK: - Notifications
    //        let ReceiverFCMToken = "fWM1lZGSxEvZtPtfkf-sZF:APA91bFsRypqHw9QLFIy6hFoe-h4QPvo7yh7NWULa8QbYm3H_eG8kKd0KL6vA9A71HjCIFjd2YYuzkbUWSQh2CAMkYuLGnpzTKDdG8Jz7PAoN0TYsMP_Ti4IAHe1aVY7C-ghf0QRiSMo"
    //       let legacyServerKey = "AAAAnjP38Rg:APA91bH6k0y3FhWBKdRImuwXyt_jgm5u-0HedjcfX30j_P6RJ5Pdc_-cGEZA_jjXUeXcLy39YO4MnIB4nWqFy9FGlrxUhdz5kVLhwdKWYMF7rtkjccrjPE_A2tXAV_9F0RK6SVUyAPmc"
    //       @State private var fcmTokenMessage = "fcmTokenMessage"
    //       @State private var instanceIDTokenMessage = "instanceIDTokenMessage"
        
      // MARK: - Firestore
      
        private var db = Firestore.firestore()
        
        private func addAnnouncement(_ announcement: Announcement) {
          do {
            let _ = try db.collection("announcements").addDocument(from: announcement)
          }
          catch {
            print(error)
          }
        }
        
        private func updateAnnouncement(_ announcement: Announcement) {
          if let documentId = announcement.id {
            do {
              try db.collection("announcements").document(documentId).setData(from: announcement)
            }
            catch {
              print(error)
            }
          }
        }
        
        private func updateOrAddAnnouncement() {
          if let _ = announcement.id {
            self.updateAnnouncement(self.announcement)
          }
          else {
              addAnnouncement(announcement)
          }
        }
        
        private func removeAnnouncement() {
          if let documentId = announcement.id {
            db.collection("announcements").document(documentId).delete { error in
              if let error = error {
                print(error.localizedDescription)
              }
            }
          }
        }
        
        // MARK: - UI handlers
        
        func handleDoneTapped() {
          self.updateOrAddAnnouncement()
        }
        
        func handleDeleteTapped() {
          self.removeAnnouncement()
        }
        
      }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    // Notifications
//    func sendMessageTouser(to token: String, title: String, body: String) {
//        print("sendMessageTouser()")
//        let urlString = "https://fcm.googleapis.com/fcm/send"
//        let url = NSURL(string: urlString)!
//        let paramString: [String : Any] = ["to" : token,
//                                           "notification" : ["title" : title, "body" : body],
//                                           "data" : ["user" : "test_id"]
//        ]
//        let request = NSMutableURLRequest(url: url as URL)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("key=\(legacyServerKey)", forHTTPHeaderField: "Authorization")
//        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
//            do {
//                if let jsonData = data {
//                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
//                        NSLog("Received data:\n\(jsonDataDict))")
//                    }
//                }
//            } catch let err as NSError {
//                print(err.debugDescription)
//            }
//        }
//        task.resume()
//    }
//
//    func handleLogTokenTouch() {
//        // [START log_fcm_reg_token]
//        let token = Messaging.messaging().fcmToken
//        print("FCM token: \(token ?? "")")
//        // [END log_fcm_reg_token]
//        self.fcmTokenMessage  = "Logged FCM token: \(token ?? "")"
//
//        // [START log_iid_reg_token]
//        InstanceID.instanceID().instanceID { (result, error) in
//          if let error = error {
//            print("Error fetching remote instance ID: \(error)")
//          } else if let result = result {
//            print("Remote instance ID token: \(result.token)")
//            self.instanceIDTokenMessage  = "Remote InstanceID token: \(result.token)"
//          }
//        }
//    }
//}
//
//
//
//
