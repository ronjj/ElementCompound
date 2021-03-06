

//
//  BookViewModel.swift
//  BookSpine
//
//  Created by Peter Friese on 09/06/2020.
//  Copyright © 2020 Google LLC. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore
import Firebase

class ProjectViewModel2: ObservableObject {
  // MARK: - Public properties
  
  @Published var project: Project
  @Published var modified = false
  
  // MARK: - Internal properties
  
  private var cancellables = Set<AnyCancellable>()
  
    
    //MARK: - Notifications
    //        let ReceiverFCMToken = "fWM1lZGSxEvZtPtfkf-sZF:APA91bFsRypqHw9QLFIy6hFoe-h4QPvo7yh7NWULa8QbYm3H_eG8kKd0KL6vA9A71HjCIFjd2YYuzkbUWSQh2CAMkYuLGnpzTKDdG8Jz7PAoN0TYsMP_Ti4IAHe1aVY7C-ghf0QRiSMo"
    //       let legacyServerKey = "AAAAnjP38Rg:APA91bH6k0y3FhWBKdRImuwXyt_jgm5u-0HedjcfX30j_P6RJ5Pdc_-cGEZA_jjXUeXcLy39YO4MnIB4nWqFy9FGlrxUhdz5kVLhwdKWYMF7rtkjccrjPE_A2tXAV_9F0RK6SVUyAPmc"
    //       @State private var fcmTokenMessage = "fcmTokenMessage"
    //       @State private var instanceIDTokenMessage = "instanceIDTokenMessage"
        
  // MARK: - Constructors
  
    init(project: Project = Project(title: "",creator: Auth.auth().currentUser?.displayName ?? "N/A",  color: Color.gray, /*dateEvent: Date(),*/ dueDate: Date(), /*completionLevel: "Idea", */ assignedStudents: [], /*priority: "Low",*/ notes: "N/A", percentComplete: 0, helpToggle: true, officerEmail: "")) {
    self.project = project
    
    self.$project
      .dropFirst()
      .sink { [weak self] project in
        self?.modified = true
      }
      .store(in: &self.cancellables)
  }
  
  // MARK: - Firestore
  private var db = Firestore.firestore()
  
  private func addProject(_ project: Project) {
    do {
      let _ = try db.collection("projects").addDocument(from: project)
    }
    catch {
      print(error)
    }
  }
  
  private func updateProject(_ project: Project) {
    if let documentId = project.id {
      do {
        try db.collection("projects").document(documentId).setData(from: project)
      }
      catch {
        print(error)
      }
    }
  }
  
  private func updateOrAddProject() {
    if let _ = project.id {
      self.updateProject(self.project)
    }
    else {
        addProject(project)
    }
  }
  
  private func removeProject() {
    if let documentId = project.id {
      db.collection("projects").document(documentId).delete { error in
        if let error = error {
          print(error.localizedDescription)
        }
      }
    }
  }
  
  // MARK: - UI handlers
  
  func handleDoneTapped() {
    self.updateOrAddProject()
  }
  
  func handleDeleteTapped() {
    self.removeProject()
  }
  
}



