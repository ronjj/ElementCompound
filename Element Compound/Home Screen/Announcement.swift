//
//  Announcement.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.
//

import SwiftUI

struct AnnouncementItem: Identifiable{
    let id = UUID()
    let text: String
  //  let date: Date
    
}

class Announcements: ObservableObject {
   @Published var items = [AnnouncementItem]()
}
