////
////  AnnouncementViewModel.swift
////  Element Compound
////
////  Created by Ronald Jabouin on 4/29/21.
////
//
//import Foundation
//import SwiftUI
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//import Firebase
//
//
//
//class ProjectsViewModel:ObservableObject {
//    @Published var projects = [Project]()
//    
//    private var db = Firestore.firestore()
//    
//    func fetchData() {
//        db.collection("projects").addSnapshotListener { (querySnapshot, error) in
//          
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//            
//            self.projects = documents.compactMap { (queryDocumentSnapshot) -> Project? in
//               return try? queryDocumentSnapshot.data(as: Project.self)
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
//    func removeProjects(atOffsets indexSet: IndexSet) {
//      let projects = indexSet.lazy.map { self.projects[$0] }
//      projects.forEach { project in
//        if let documentId = project.id {
//          db.collection("projects").document(documentId).delete { error in
//            if let error = error {
//              print("Unable to remove document: \(error.localizedDescription)")
//            }
//          }
//        }
//      }
//    }
//
//}
