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
        CameraItem(name: "Lumix GH4", shortDescription: "Basic camera for video recording.", longDescription: "The go-to Element camera, the GH4 is a reliable camera that delivers professional-quality videos. The GH4 is equipped with 4K and HD capabilities and offers basic audio recording.", imageURL: "questionmark"),
        
        CameraItem(name: "Lumix GH5", shortDescription: "4K camera for video recording.", longDescription: "The professional level GH5 from LUMIX delivers high quality 4K video with its improved design from the GH4. The mirrorless camera delivers crisp video, while in-camera stabilization provides smooth movement, and the in-camera ", imageURL: "questionmark"),
        
        CameraItem(name: "Lumix GH5s", shortDescription: "Optimized 4K camera for video recording.", longDescription: "The GH5s is one of the most powerful cameras in our equipment inventory. Optimized for low light conditions, the GH5s is a go-to camera for high-end projects. The camera has super-basic audio capabilities and can be customized with an assortment of lenses and gimbals.", imageURL: "questionmark"),
        
        CameraItem(name: "Sony A7SII", shortDescription: "High end 4K video camera.", longDescription: "The Sony A7SII is the elite camera of Element. With built-in stabilization technology, the A7SII delivers smooth 4K video. The camera microphone records basic audio. The ultra-sensitive filter gives the camera dynamic performance in most lighting conditions. The A7SII also records full pixel readouts, amplifying video quality for the editing room.", imageURL: "questionmark"),
        
        CameraItem(name: "Ricoh Theta 360", shortDescription: "360° video camera.", longDescription: "The THETA 360° camera stitches two images from its dual lenses to create completely immersive 360° environments. THETA captures still images, panoramas, and videos as seen in the Chaminade Virtual tour.", imageURL: "questionmark"),
        
        CameraItem(name: "Osmo Pocket", shortDescription: "Compact action camera", longDescription: "The Osmo Pocket provides 1080p video in a super-compact camera, mounted on a three-axis gimbal. The Osmo Pocket is a useful tool for mobile shots, time-lapses, and panoramas. Its simplistic design allows users to store the Osmo easily and record video seamlessly", imageURL: "questionmark"),
        
        CameraItem(name: "Osmo Pocket Gen 2", shortDescription: "Versatile action camera", longDescription: "Osmo pocket 2 keeps the same compact design while adding new features and accessories to the older design. The Osmo Pocket 2 comes with multiple bases, such as a standard base, or a mini tripod. The Osmo Pocket 2 adds audio capabilities to its old video modes, making it the perfect camera for mobile interviews.", imageURL: "questionmark")
        
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
