//
//  AnnouncementViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/29/21.
//

import Foundation
import Combine
import FirebaseFirestore



//class AnnouncementsViewModel:ObservableObject {
//    @Published var announcements = [Announcement]()
//
//    private var db = Firestore.firestore()
//
//    func fetchData() {
//        db.collection("announcements").order(by: "dateEvent", descending: true).addSnapshotListener { (querySnapshot, error) in
//
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.announcements = documents.compactMap { (queryDocumentSnapshot) -> Announcement? in
//               return try? queryDocumentSnapshot.data(as: Announcement.self)
////
////                let data = queryDocumentSnapshot.data()
////
////                let message = data["message"] as? String ?? ""
////
////                return Announcement(message: message)
////
//            }
//        }
//    }
//
//}


class AnnouncementsViewModel: ObservableObject {
  @Published var announcements = [Announcement]()

  private var db = Firestore.firestore()
  private var listenerRegistration: ListenerRegistration?
  
  deinit {
    unsubscribe()
  }
  
  func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }
  
  func subscribe() {
    if listenerRegistration == nil {
      listenerRegistration = db.collection("announcements").order(by: "dateEvent", descending: true).addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
        
        self.announcements = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: Announcement.self)
        }
      }
    }
  }
  
  func removeAnnouncements(atOffsets indexSet: IndexSet) {
    let announcements = indexSet.lazy.map { self.announcements[$0] }
      announcements.forEach { announcement in
      if let documentId = announcement.id {
        db.collection("announcements").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }

  
}
