//
//  AnnouncementEditView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import UIKit
import Firebase
import Combine
import FirebaseMessaging
import FirebaseFirestore
import UserNotifications


enum Mode2 {
    case new
    case edit
}

enum Action2 {
    case delete
    case done
    case cancel
}

// Please change it your physical phone device FCM Token
// To get it, touch the handleLogTokenTouch button and see log
let ReceiverFCMToken = "fCS9FBiNWkuuugsMjT7Ig4:APA91bHYRfimBT-JsEfibBHp2XkzR9RotxRc8X7VwjGtrg4nBLAsGBo0CqTv8Tgqjk_C6QG41O992nlRklh7fP1I9mnnSZugZKMnNC-_cKm_sUA_IxBsBky70mwCIeZcv0jD32Hu07Jz"



// Please change it your Firebase Legacy server key
// Firebase -> Project settings -> Cloud messaging -> Legacy server key
let legacyServerKey = "AAAAnjP38Rg:APA91bH6k0y3FhWBKdRImuwXyt_jgm5u-0HedjcfX30j_P6RJ5Pdc_-cGEZA_jjXUeXcLy39YO4MnIB4nWqFy9FGlrxUhdz5kVLhwdKWYMF7rtkjccrjPE_A2tXAV_9F0RK6SVUyAPmc"

struct AnnouncementAddView: View {
    
    @StateObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode
    //let sender = PushNotificationSender()
    let textLimit = 21
    let textLimit2 = 90
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
   
    @State private var fcmTokenMessage = "fcmTokenMessage"
    @State private var instanceIDTokenMessage = "instanceIDTokenMessage"
    @State private var notificationTitle: String = ""
       @State private var notificationContent: String = ""
   
    @State var presentActionSheet = false
    var mode: Mode2 = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    
    var cancelButton: some View {
        Button(action: { self.handleCancelTapped() }) {
            Text("Cancel")
        }
    }
    
    var saveButton: some View {
        Button(action: {
            self.handleDoneTapped()
           
        }) {
            Text(mode == .new ? "Done" : "Save")
        }
       // .disabled(!viewModel.modified)
        .disabled(viewModel.announcement.title.isEmpty || viewModel.announcement.message.isEmpty)
    }

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Title")) {
                    TextEditor(text:$viewModel.announcement.title)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .onReceive(Just(viewModel.announcement.title)) { _ in limitText(textLimit) }
                   
                }
                
                Section(header: Text("Message")) {
                    TextEditor(text:$viewModel.announcement.message)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .onReceive(Just(viewModel.announcement.message)) { _ in limitText2(textLimit2) }
                }
                
                if mode == .edit {
                    Section {
                        Button("Delete Announcement") { self.presentActionSheet.toggle() }
                            .foregroundColor(.red)
                    }
                }
        }
            
            .navigationTitle(mode == .new ? "New Announcement" : "Edit Announcement")
            .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
            .navigationBarItems(
                leading: cancelButton,
                trailing: saveButton
            )
            
            .actionSheet(isPresented: $presentActionSheet) {
                ActionSheet(title: Text("Are you sure?"),
                            buttons: [
                                .destructive(Text("Delete Announcement"),
                                             action: { self.handleDeleteTapped() }),
                                .cancel()
                            ])
            }
    }
}
    func sendMessageTouser(to token: String, title: String, body: String) {
           print("sendMessageTouser()")
           let urlString = "https://fcm.googleapis.com/fcm/send"
           let url = NSURL(string: urlString)!
           let paramString: [String : Any] = ["to" : token,
                                              "notification" : ["title" : title, "body" : body],
                                              "data" : ["user" : "test_id"]
           ]
           let request = NSMutableURLRequest(url: url as URL)
           request.httpMethod = "POST"
           request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.setValue("key=\(legacyServerKey)", forHTTPHeaderField: "Authorization")
           let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
               do {
                   if let jsonData = data {
                       if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                           NSLog("Received data:\n\(jsonDataDict))")
                       }
                   }
               } catch let err as NSError {
                   print(err.debugDescription)
               }
           }
           task.resume()
       }
       
       func handleLogTokenTouch() {
           // [START log_fcm_reg_token]
           let token = Messaging.messaging().fcmToken
           print("FCM token: \(token ?? "")")
           // [END log_fcm_reg_token]
           self.fcmTokenMessage  = "Logged FCM token: \(token ?? "")"

           // [START log_iid_reg_token]
           InstanceID.instanceID().instanceID { (result, error) in
             if let error = error {
               print("Error fetching remote instance ID: \(error)")
             } else if let result = result {
               print("Remote instance ID token: \(result.token)")
               self.instanceIDTokenMessage  = "Remote InstanceID token: \(result.token)"
             }
           }
           // [END log_iid_reg_token]
       }
    
    func handleCancelTapped() {
        self.dismiss()
    }
    
    func handleDoneTapped() {
        self.viewModel.handleDoneTapped()
        self.dismiss()
    }
    
    func handleDeleteTapped() {
        viewModel.handleDeleteTapped()
        self.dismiss()
        self.completionHandler?(.success(.delete))
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }


    func limitText(_ upper: Int) {
            if viewModel.announcement.title.count > upper {
                viewModel.announcement.title = String(viewModel.announcement.title.prefix(upper))
            }
        }
    
    func limitText2(_ upper: Int) {
            if viewModel.announcement.message.count > upper {
                viewModel.announcement.message = String(viewModel.announcement.message.prefix(upper))
            }
        }
}

