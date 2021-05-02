//
//  AnnouncementViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import Foundation
import Firebase

class AnnoucnementViewModel: ObservableObject{
    @Published var announcement: Announcement = Announcement(message: "")
    
    private var db = Firestore.firestore()
    
    
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
