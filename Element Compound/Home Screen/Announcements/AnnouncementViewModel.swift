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
