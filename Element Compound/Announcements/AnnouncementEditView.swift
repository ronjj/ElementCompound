//
//  AnnouncementEditView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import Firebase

struct AnnouncementEditView: View {
    
    @StateObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    let ReceiverFCMToken = "fWM1lZGSxEvZtPtfkf-sZF:APA91bFsRypqHw9QLFIy6hFoe-h4QPvo7yh7NWULa8QbYm3H_eG8kKd0KL6vA9A71HjCIFjd2YYuzkbUWSQh2CAMkYuLGnpzTKDdG8Jz7PAoN0TYsMP_Ti4IAHe1aVY7C-ghf0QRiSMo"
    let legacyServerKey = "AAAAnjP38Rg:APA91bH6k0y3FhWBKdRImuwXyt_jgm5u-0HedjcfX30j_P6RJ5Pdc_-cGEZA_jjXUeXcLy39YO4MnIB4nWqFy9FGlrxUhdz5kVLhwdKWYMF7rtkjccrjPE_A2tXAV_9F0RK6SVUyAPmc"
    @State private var fcmTokenMessage = "fcmTokenMessage"
    @State private var instanceIDTokenMessage = "instanceIDTokenMessage"


    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Title")) {
                    TextEditor(text:$viewModel.announcement.title)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                Section(header: Text("Message")) {
                    TextEditor(text:$viewModel.announcement.message)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationTitle("New Announcement")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        handleCancelTapped()
                    }) {
                        Text("Cancel")
                    }
                    
                    Button(action: {
                        handleDoneTapped()
                        self.sendMessageTouser(to: ReceiverFCMToken, title: self.viewModel.announcement.title, body: self.viewModel.announcement.message)
                    }) {
                        Text("Send")
                    }
                    .disabled(!viewModel.modified)
                }
                
            }
        }
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    func handleDoneTapped() {
        viewModel.save()
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
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
    
}
struct AnnouncementEditView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementEditView()
    }
}



 

