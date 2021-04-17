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


struct AudioItem: Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    
}


struct MiscItem: Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    
}


struct MockData {
    
    static let sampleCamera = CameraItem(name: "GH5S", shortDescription: "best camera in office", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "placeholder")
    static let sampleComputer = ComputerItem(name: "iMac Pro", shortDescription: "Student Computer", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "placeholder")
    static let sampleAudio = AudioItem(name: "GH5S", shortDescription: "best camera in office", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "placeholder")
    static let sampleMisc = MiscItem(name: "Camera Tripod", shortDescription: "Student Computer", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "placeholder")

    
    static let cameras = [
        CameraItem(name: "Lumix GH4", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        CameraItem(name: "Lumix GH5", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        CameraItem(name: "Lumix GH5s", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        CameraItem(name: "Sony A7SII", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        CameraItem(name: "Ricoh Theta 360", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        CameraItem(name: "Osmo Pocket", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        CameraItem(name: "Osmo Pocket Gen 2", shortDescription: "", longDescription: "", imageURL: "questionmark")
        
    ]
    
    
    static let computers = [
        ComputerItem(name: "iMac Pro", shortDescription: "", longDescription: "", imageURL: "questionmark")    ]
    
    
    static let audios = [
        AudioItem(name: "RODE CasterPro", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "RODE PodMic", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "RODE Lapel Mic", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "Shure MV7", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "Shure SM7b", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "Shotgun Mic", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "ZOOM", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "XLR Cable", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "Headphones", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        AudioItem(name: "MixPre", shortDescription: "", longDescription: "", imageURL: "questionmark")
    ]
    
    
    static let miscs = [
        MiscItem(name: "DJI Mavic", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "DJI Mavic Mini 2", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "Ronin", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "Ronin S", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "Batteries", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "Adapters/Dongles", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "SD Cards", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "Micro SD Card", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "USB C Cable", shortDescription: "", longDescription: "", imageURL: "questionmark"),
        MiscItem(name: "Extension Cable", shortDescription: "", longDescription: "", imageURL: "questionmark")
      
    ]
}
