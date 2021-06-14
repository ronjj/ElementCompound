//
//  Announcement.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase
import GoogleSignIn


struct Project: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var message: String
    var title: String
   
    var sender: String = Auth.auth().currentUser?.displayName ?? "N/A"
   // var color: Color = Color.random
    var dateEvent: Date
       var dateString: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "MM/dd/YYYY"
           return formatter.string(from: dateEvent)
       }
        var timeString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            formatter.timeZone = NSTimeZone(name: "EDT") as TimeZone?
            return formatter.string(from: dateEvent)
        }

    
    init(id: UUID = UUID(), message: String, title: String, sender: String, /*color: Color,*/ dateEvent: Date) {
       // self.id = id
        self.message = message
        self.title = title
     //   self.color = color
        self.sender = sender
        self.dateEvent = dateEvent
    }
    
    
    enum CodingKeys: String, CodingKey {
        case message
        case sender
        case dateEvent
        case title
       
       // case color
    }
}



