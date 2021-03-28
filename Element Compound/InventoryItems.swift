//
//  InventoryItems.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import Foundation

struct CameraItem: Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    
}

struct ComputerItem: Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    
}

struct MockData{
    static let sampleCamera = CameraItem(name: "GH5S", shortDescription: "best camera in office", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "asian-flank-steak")
    
    static let sampleComputer = ComputerItem(name: "iMac Pro", shortDescription: "Student Computer", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "asian-flank-steak")
    
    
    static let cameras = [sampleCamera,sampleCamera]
    
    static let computers = [sampleComputer, sampleComputer]
}
