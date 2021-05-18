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


struct Announcement: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var message: String
    var title: String
    var photoURL: URL = (Auth.auth().currentUser?.photoURL)!
    var sender: String = Auth.auth().currentUser?.displayName ?? "N/A"
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

    
 
    
    
    enum CodingKeys: String, CodingKey {
        case message
        case sender
        case dateEvent
        case title
        case photoURL
      
    }
}



