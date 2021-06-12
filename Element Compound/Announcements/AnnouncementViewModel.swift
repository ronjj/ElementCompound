//
//  AnnouncementViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import Foundation
import Firebase
import Combine
import SwiftUI

class AnnoucnementViewModel: ObservableObject{
    @Published var announcement: Announcement = Announcement(message: "", title: "",  photoURL:(Auth.auth().currentUser?.photoURL!)!,  sender: Auth.auth().currentUser?.displayName ?? "N/A",  /*color: Color.blue,*/ dateEvent: Date())
    @Published var modified = false
    
    private var db = Firestore.firestore()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(announcement: Announcement = Announcement(message: "", title: "",  photoURL: (Auth.auth().currentUser?.photoURL!)!,  sender: Auth.auth().currentUser?.displayName ?? "N/A",  /*color: Color.blue,*/ dateEvent: Date()
)) {
        self.announcement = announcement
        self.$announcement
            .dropFirst()
            .sink{ [weak self] announcement in
                self?.modified = true
            }
            .store(in: &cancellables)
    }
    
    func addAnnouncement(announcement: Announcement){
        do {
          let _ =  try db.collection("announcements").addDocument(from: announcement)
        }
        catch{
            print(error)
        }
    }
    
    func save() {
        addAnnouncement(announcement: announcement)
    }
}



//let ReceiverFCMToken = "fWM1lZGSxEvZtPtfkf-sZF:APA91bFsRypqHw9QLFIy6hFoe-h4QPvo7yh7NWULa8QbYm3H_eG8kKd0KL6vA9A71HjCIFjd2YYuzkbUWSQh2CAMkYuLGnpzTKDdG8Jz7PAoN0TYsMP_Ti4IAHe1aVY7C-ghf0QRiSMo"
//let legacyServerKey = "AAAAnjP38Rg:APA91bH6k0y3FhWBKdRImuwXyt_jgm5u-0HedjcfX30j_P6RJ5Pdc_-cGEZA_jjXUeXcLy39YO4MnIB4nWqFy9FGlrxUhdz5kVLhwdKWYMF7rtkjccrjPE_A2tXAV_9F0RK6SVUyAPmc"
//
//struct AnnouncementViewModelStruct: View {
//    @State private var fcmTokenMessage = "fcmTokenMessage"
//    @State private var instanceIDTokenMessage = "instanceIDTokenMessage"
//    
//    @State private var notificationTitle: String = ""
//    @State private var notificationContent: String = ""
//    var body: some View {
//        VStack {
//            Text(fcmTokenMessage).padding(20)
//            Text(instanceIDTokenMessage).padding(20)
//            Button(action: {self.handleLogTokenTouch()}) {
//                Text("Get user FCM Token String").font(.title)
//            }.padding(20)
//            TextField("Add Notification Title", text: $notificationTitle).textFieldStyle(RoundedBorderTextFieldStyle()).padding(20)
//            TextField("Add Notification Content", text: $notificationContent).textFieldStyle(RoundedBorderTextFieldStyle()).padding(20)
//            Button(action: {self.sendMessageTouser(to: ReceiverFCMToken, title: self.notificationTitle, body: self.notificationContent)
//                self.notificationTitle = ""
//                self.notificationContent = ""
//            }) {
//                Text("Send message to User").font(.title)
//            }.padding(20)
//        }
//    }
//    
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
//        // [END log_iid_reg_token]
//    }
//}


