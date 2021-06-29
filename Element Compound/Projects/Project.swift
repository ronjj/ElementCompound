//
//  Announcement.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase



struct Project: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    //@DocumentID var id: String?
    var title: String
    var creator: String = Auth.auth().currentUser?.displayName ?? "N/A"
   // var color: Color = Color.random
//    var dateEvent: Date
//       var dateString: String {
//           let formatter = DateFormatter()
//           formatter.dateFormat = "MM/dd/YYYY"
//           return formatter.string(from: dateEvent)
//       }
//        var timeString: String {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "h:mm a"
//            formatter.timeZone = NSTimeZone(name: "EDT") as TimeZone?
//            return formatter.string(from: dateEvent)
//       }
    var dueDate: Date
        var pickedDateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/YYYY"
            return formatter.string(from: dueDate)
        }
        var pickedTimeString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            formatter.timeZone = NSTimeZone(name: "EDT") as TimeZone?
            return formatter.string(from: dueDate)
        }
  //  var completionLevel: String
    var assignedStudents: [String]
   //var priority: String
    var notes: String
    
    
    
 

//    init(id: UUID = UUID(), title: String, creator: String, /*color: Color,*/ dateEvent: Date, dueDate: Date, completionLevel: String, assignedStudents: [String], priority: String, notes: String)
//    {
//     // self.id = id
//        self.title = title
//     //   self.color = color
//        self.creator = creator
//        self.dateEvent = dateEvent
//        self.dueDate = dueDate
//        self.completionLevel = completionLevel
//        self.assignedStudents = assignedStudents
//        self.priority = priority
//        self.notes = notes
//      
//    }

    
    enum CodingKeys: String, CodingKey {
        case title
        case creator
      //  case dateEvent
        case dueDate
      //  case completionLevel
        case assignedStudents
     //   case priority
        case notes
       // case color
        
    }
}



