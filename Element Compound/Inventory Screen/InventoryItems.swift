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
        CameraItem(name: "Lumix GH4", shortDescription: "Basic camera for video recording.", longDescription: "The go-to Element camera, the GH4 is a reliable camera that delivers professional-quality videos. The GH4 is equipped with 4K and HD capabilities and offers basic audio recording.", imageURL: "soccerball"),
        
        CameraItem(name: "Lumix GH5", shortDescription: "4K camera for video recording.", longDescription: "The professional level GH5 from LUMIX delivers high quality 4K video with its improved design from the GH4. The mirrorless camera delivers crisp video, while in-camera stabilization provides smooth movement, and the in-camera ", imageURL: "black"),
        
        CameraItem(name: "Lumix GH5s", shortDescription: "Optimized 4K camera for video recording.", longDescription: "The GH5s is one of the most powerful cameras in our equipment inventory. Optimized for low light conditions, the GH5s is a go-to camera for high-end projects. The camera has super-basic audio capabilities and can be customized with an assortment of lenses and gimbals.", imageURL: "soccerball"),
        
        CameraItem(name: "Sony A7SII", shortDescription: "High end 4K video camera.", longDescription: "The Sony A7SII is the elite camera of Element. With built-in stabilization technology, the A7SII delivers smooth 4K video. The camera microphone records basic audio. The ultra-sensitive filter gives the camera dynamic performance in most lighting conditions. The A7SII also records full pixel readouts, amplifying video quality for the editing room.", imageURL: "questionmark"),
        
        CameraItem(name: "Ricoh Theta 360", shortDescription: "360° video camera.", longDescription: "The THETA 360° camera stitches two images from its dual lenses to create completely immersive 360° environments. THETA captures still images, panoramas, and videos as seen in the Chaminade Virtual tour.", imageURL: "questionmark"),
        
        CameraItem(name: "Osmo Pocket", shortDescription: "Compact action camera", longDescription: "The Osmo Pocket provides 1080p video in a super-compact camera, mounted on a three-axis gimbal. The Osmo Pocket is a useful tool for mobile shots, time-lapses, and panoramas. Its simplistic design allows users to store the Osmo easily and record video seamlessly", imageURL: "questionmark"),
        
        CameraItem(name: "Osmo Pocket Gen 2", shortDescription: "Versatile action camera", longDescription: "Osmo pocket 2 keeps the same compact design while adding new features and accessories to the older design. The Osmo Pocket 2 comes with multiple bases, such as a standard base, or a mini tripod. The Osmo Pocket 2 adds audio capabilities to its old video modes, making it the perfect camera for mobile interviews.", imageURL: "questionmark"),
        
        CameraItem(name: "Lenses", shortDescription: "An array of camera accessories available for club use.", longDescription: "Element has a wide range of lenses, from standard video lenses, to fish eye lenses. With a wide range of focal lengths, our inventory has the right accessory for most video projects.", imageURL: "questionmark")
        
    ]
    
    
    static let computers = [
        ComputerItem(name: "iMac Pro", shortDescription: "The two desktop computers that the club uses", longDescription: "", imageURL: "questionmark")    ]
    
    
    static let audios = [
        AudioItem(name: "RODE CasterPro", shortDescription: "Premium Podcast sound mixer used for recording podcastss.", longDescription: "The RODECaster Pro is the premiere audio device for recording podcast audio. Element members have access to the powerful sound mixer to record multiple audio tracks simultaneously while adding audio effects live.", imageURL: "questionmark"),
        
        AudioItem(name: "RODE PodMic", shortDescription: "Professional level Podcast microphones", longDescription: "The RODE PodMic is a high quality microphone for podcast recordings. It delivers crisp, clean audio for the highest audio quality.", imageURL: "questionmark"),
        
        AudioItem(name: "RODE Lapel Mic", shortDescription: "Personal microphones.", longDescription: "RODE lapel mics are the best audio option for capturing audio for a specific subject. Maintaining the", imageURL: "questionmark"),
        
        AudioItem(name: "Shure MV7", shortDescription: "Premium Podcast Microphone", longDescription: "The Shure MV7 is our most powerful podcast microphone. The MV7 delivers the best audio quality imaginable to give you a product on par with the pros.", imageURL: "questionmark"),
        
        AudioItem(name: "Shure SM7b", shortDescription: "Standard Podcast Microphone", longDescription: "The Shure SM7b is our standard podcast microphone, delivering high quality audio. The SM7b performs the regular tasks required to maintain a successful podcast.", imageURL: "questionmark"),
        
        AudioItem(name: "Shotgun Mic", shortDescription: "Professional filmmaking microphones.", longDescription: "Our shotgun mics are the same microphones thousands of professional filmmakers use to record audio for films and interviews. Members get to use these microphones to get a hands on experience with real world filmmaking tools.", imageURL: "questionmark"),
        
        AudioItem(name: "ZOOM", shortDescription: "Portable audio recorder.", longDescription: "The two ZOOM audio recorders we have are portable enough to be mobile, while also providing the high quality recording we need. Small enough to fit in your backpack, the ZOOMs have four XLR ports and an external microphone. Thanks to its versatility, the ZOOM is our go-to recorder.", imageURL: "questionmark"),
        
        AudioItem(name: "XLR Cable", shortDescription: "XLR multi-use cable", longDescription: "A regular XLR calbe, often used for a mutltitude of audio equipment", imageURL: "questionmark"),
        
        AudioItem(name: "Headphones", shortDescription: " AudioTechnica brand headphones. ", longDescription: " Our over ear headphones are high quality audio devices. Approved for podcast recording and sound mixing, you won’t miss a beat with these.", imageURL: "questionmark"),
        
        AudioItem(name: "MixPre", shortDescription: "Professional audio recorder for filmmaking", longDescription: "The MixPre is a recording device that delivers professional audio quality for filmmaking. With more tracks and easy sound manipulation, the MixPre is the best audio device for filmmaking.", imageURL: "questionmark")
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
