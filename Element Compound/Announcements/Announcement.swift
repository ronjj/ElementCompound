//
//  Announcement.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.
//

import SwiftUI
import UIKit
import FirebaseFirestoreSwift
import Firebase
import GoogleSignIn



struct Announcement: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var message: String
    var title: String
  //  var color: Color
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

    
    init(id: UUID = UUID(), message: String, title: String, /* color: Color, */photoURL: URL, sender: String, dateEvent: Date) {
       // self.id = id
        self.message = message
        self.title = title
        //self.color = color
        self.photoURL = photoURL
        self.sender = sender
        self.dateEvent = dateEvent
    }
    
    
    enum CodingKeys: String, CodingKey {
        case message
        case sender
        case dateEvent
        case title
        case photoURL
       // case color
    }
}



//extension Color: Codable {
//  init(hex: String) {
//    let rgba = hex.toRGBA()
//    self.init(.sRGB,
//              red: Double(rgba.r),
//              green: Double(rgba.g),
//              blue: Double(rgba.b),
//              opacity: Double(rgba.alpha))
//    }
//
//  public init(from decoder: Decoder) throws {
//    let container = try decoder.singleValueContainer()
//    let hex = try container.decode(String.self)
//    self.init(hex: hex)
//  }
//
//  public func encode(to encoder: Encoder) throws {
//    var container = encoder.singleValueContainer()
//    try container.encode(toHex)
//  }
//  //... (code for translating between hex and RGBA ommitted for brevity)
//}
//
