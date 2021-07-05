////
////  Task.swift
////  Element Compound
////
////  Created by Ronald Jabouin on 7/4/21.
////
//
//import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//enum TaskPriority: Int, Codable {
//  case high
//  case medium
//  case low
//}
//
//struct Task: Codable, Identifiable {
//  @DocumentID var id: String?
//  var title: String
//  var priority: TaskPriority
//  var completed: Bool
//  @ServerTimestamp var createdTime: Timestamp?
//  var userId: String?
//}
//
//#if DEBUG
//let testDataTasks = [
//  Task(title: "Implement UI", priority: .medium, completed: true),
//  Task(title: "Connect to Firebase", priority: .medium, completed: false),
//  Task(title: "????", priority: .high, completed: false),
//  Task(title: "PROFIT!!!", priority: .high, completed: false)
//]
//#endif
