//
//  ProjectsViewModel2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/19/21.
//

import Foundation
import Combine
import FirebaseFirestore

class ProjectsViewModel2: ObservableObject {
  @Published var projects = [Project]()
  
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
      listenerRegistration = db.collection("projects").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
        
        self.projects = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: Project.self)
        }
      }
    }
  }
  
  func removeProjects(atOffsets indexSet: IndexSet) {
    let projects = indexSet.lazy.map { self.projects[$0] }
    projects.forEach { project in
      if let documentId = project.id {
        db.collection("projects").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }
}


//
//  func subscribeNewest() {
//    if listenerRegistration == nil {
//      listenerRegistration = db.collection("books2").order(by: "dateEvent", descending: true).addSnapshotListener { (querySnapshot, error) in
//        guard let documents = querySnapshot?.documents else {
//          print("No documents")
//          return
//        }
//
//        self.projects = documents.compactMap { queryDocumentSnapshot in
//          try? queryDocumentSnapshot.data(as: Project.self)
//        }
//      }
//    }
//  }
//
//    func subscribeClosest() {
//      if listenerRegistration == nil {
//        listenerRegistration = db.collection("books2").order(by: "dueDate", descending: true).addSnapshotListener { (querySnapshot, error) in
//          guard let documents = querySnapshot?.documents else {
//            print("No documents")
//            return
//          }
//
//          self.projects = documents.compactMap { queryDocumentSnapshot in
//            try? queryDocumentSnapshot.data(as: Project.self)
//          }
//        }
//      }
//    }
//
//    func subscribePriority() {
//      if listenerRegistration == nil {
//        listenerRegistration = db.collection("books2").order(by: "priority", descending: false).addSnapshotListener { (querySnapshot, error) in
//          guard let documents = querySnapshot?.documents else {
//            print("No documents")
//            return
//          }
//
//          self.projects = documents.compactMap { queryDocumentSnapshot in
//            try? queryDocumentSnapshot.data(as: Project.self)
//          }
//        }
//      }
//    }
    
 
