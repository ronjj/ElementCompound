//
//  Announcement.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.
//

import SwiftUI
import FirebaseFirestoreSwift


struct Announcement: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var message: String
 
 
    
    enum CodingKeys: String, CodingKey {
        case message
    
    }
}

//class Announcements: ObservableObject {
//   @Published var items = [AnnouncementItem]()
//}

