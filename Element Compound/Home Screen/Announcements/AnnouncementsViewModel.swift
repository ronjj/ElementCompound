//
//  AnnouncementViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/29/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class AnnouncementsViewModel:ObservableObject {
    @Published var announcements = [Announcement]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("announcements").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.announcements = documents.compactMap { (queryDocumentSnapshot) -> Announcement? in
               return try? queryDocumentSnapshot.data(as: Announcement.self)
//
//                let data = queryDocumentSnapshot.data()
//
//                let message = data["message"] as? String ?? ""
//
//                return Announcement(message: message)
//
            }
        }
    }
}
