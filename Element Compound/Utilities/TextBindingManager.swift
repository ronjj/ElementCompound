//
//  TextBindingManager.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/28/21.
//

import SwiftUI

class TextBindingManager: ObservableObject {
    
        
        //Version 1
//        didSet {
//            if text.count > characterLimit && oldValue.count <= characterLimit {
//                text = oldValue
//            }
//        }
//    }
//    let characterLimit: Int
//
//    init(limit: Int = 5){
//        characterLimit = limit
//    }
        
        //Version 2
//        didSet {
//            if text.count > 15 && oldValue.count <= 15 {
//                text = oldValue
//            }
        }
        
        
        
        
        //MARK: Using The Text Limiter
        // https://stackoverflow.com/questions/56476007/swiftui-textfield-max-length
