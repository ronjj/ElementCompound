//
//  CourseSectionModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/27/21.
//

import Foundation
import SwiftUI

struct CourseItem: Decodable, Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let imageURL: String
}


struct Data {
    
    static let sampleCourse = CourseItem(name: "Mock Camera", shortDescription: "Mock Descriptiin", imageURL: "black")
    
    static let courses = [
        CourseItem( name: "Camera",
                    shortDescription: "camera description.",
                    imageURL: "black"),
        
        CourseItem( name: "Editing",
                    shortDescription: "editing description.",
                    imageURL: "sony 350x200"),
        
    ]
}
