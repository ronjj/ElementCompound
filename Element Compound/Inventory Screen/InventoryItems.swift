//
//  InventoryItems.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import Foundation
import SwiftUI

struct CameraItem: Decodable, Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    let bigImageURL: String
    let color = Color.red
}


struct ComputerItem:  Decodable, Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    let bigImageURL: String
    
}

struct LenseItem:  Decodable, Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    let bigImageURL: String
    
}

struct AudioItem:  Decodable, Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    let bigImageURL: String
    
}


struct MiscItem:  Decodable, Identifiable{
    let id = UUID()
    let name: String
    let shortDescription: String
    let longDescription: String
    let imageURL: String
    let bigImageURL: String
    
}

struct CameraResponse: Decodable {
    let request: [CameraItem]
}

struct ComputerResponse: Decodable {
    let request: [ComputerItem]
}

struct AudioResponse: Decodable {
    let request: [AudioItem]
}

struct MiscResponse: Decodable {
    let request: [MiscItem]
}


struct MockData {
    
    static let sampleCamera = CameraItem(name: "GH5S", shortDescription: "best camera in office", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Fredcubepdx%2F&psig=AOvVaw2nQECAIXzD3gS0iq-AUv5I&ust=1626878032363000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCODE0Yrv8fECFQAAAAAdAAAAABAJ", bigImageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Fredcubepdx%2F&psig=AOvVaw2nQECAIXzD3gS0iq-AUv5I&ust=1626878032363000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCODE0Yrv8fECFQAAAAAdAAAAABAJ")
    static let sampleComputer = ComputerItem(name: "iMac Pro", shortDescription: "Student Computer", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "black", bigImageURL: "black")
    static let sampleAudio = AudioItem(name: "GH5S", shortDescription: "best camera in office", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "black", bigImageURL: "black")
    static let sampleMisc = MiscItem(name: "Camera Tripod", shortDescription: "Student Computer", longDescription: "Best camera in the office. This camera is typically reserved for officers", imageURL: "black", bigImageURL: "black")
    static let sampleLense = LenseItem(name: "Sony Lens", shortDescription: "Lens for our sony cameras", longDescription: "Very good lense that gives a crsip image", imageURL: "black", bigImageURL: "black")
    
    
    static let cameras = [
        CameraItem( name: "Lumix GH4",
                    shortDescription: "Entry-Level Camera for New Student Members.",
                    longDescription: "The go-to camera for new student members, the GH4 is a reliable and durable camera that captures professional-quality video. The GH4 is equipped with 4K and HD capability for video, basic audio recording, and can be used with a variety of entry-level lenses dmd ddm md",
                    imageURL: "sony 350x200",
                    bigImageURL: "Mavic Mini 2"),
        
        CameraItem(name: "Lumix GH5",
                   shortDescription: "4K Camera for Mid-Level Projects.",
                   longDescription: "The professional standard DSLR from Lumix, the GH5 captures high quality 4K video with improved settings and features over the GH4. With stronger built in stabilization, and compatibility with our professional suite of lenses, the GH5 is prime for more experienced student members working on Mid-Level Projects. ",
                   imageURL: "Rode (450x360) Final",
                   bigImageURL: "black"),
        
        CameraItem( name: "Lumix GH5s",
                    shortDescription: "Optimized 4K Camera for High-Level Projects.",
                    longDescription: "The GH5s is one of the most powerful cameras in our equipment inventory. Optimized for low light conditions, the GH5s is a go-to camera for high-end projects. The camera has super-basic audio capabilities and can be customized with an assortment of lenses and gimbals.",
                    imageURL: "Mavic Mini 2 (450x360)",
                    bigImageURL: "Mavic Mini 2"),
        
        CameraItem(name: "Sony A7SII",
                   shortDescription: "High-End 4K Camera for Experienced Students.",
                   longDescription: "As the most elite camera of Element, the Sony A7s Mark II is extremely versatile, and reserved for senior student members working on high-level projects. With its sensitive filter, the A7s II delivers smooth 4K video and dynamic, crisp performance in most lighting conditions. The A7s II shoots in full pixel readouts (RAW), allowing for complete quality control during editing.",
                   imageURL: "Mavic Pro 2 (450x360)",
                   bigImageURL: "Mavic Pro 2"),
        
        CameraItem(name: "Ricoh Theta 360",
                   shortDescription: "360° Camera for Immersive Photos.",
                   longDescription: "The THETA 360° camera stitches two images from its dual lenses to create completely immersive 360° environments. THETA captures still images, panoramas, and videos, as seen throughout the Chaminade Virtual Tour. ",
                   imageURL: "sony 85 - blue hand",
                   bigImageURL: "black"),
        
        CameraItem(name: "Osmo Pocket",
                   shortDescription: "Compact Action Camera for Simple Shoots.",
                   longDescription: "The Osmo Pocket provides 1080p video in a super-compact form factor, mounted on a three-axis gimbal. The Osmo Pocket is prime for mobile shots, time-lapses, and panoramas. Its simplistic design allows users to store the Osmo easily and record video seamlessly.",
                   imageURL: "GH5s I",
                   bigImageURL: "GH5s I"),
        
        CameraItem(name: "Osmo Pocket Gen 2",
                   shortDescription: "Versatile Action Camera for Simple Shots.",
                   longDescription: "The Osmo Pocket 2 keeps the same compact design but adds new features and accessories to strengthen usability. The Osmo Pocket 2 comes with multiple bases, such as a standard base, or a mini tripod. The Osmo Pocket 2 adds audio capabilities to its old video modes, making it the perfect camera for mobile interviews.",
                   imageURL: "GH5 I",
                   bigImageURL: "GH5 B"),
        
        
    ]
    
    
    static let lenses = [
        LenseItem( name: "Sony E-Mount 24mm",
                   shortDescription: "Medium Focal Length Lens for Sony A7s II.",
                   longDescription: "Full Name: Sony E-Mount 24mm FE 1.4 Full Frame Lens. The E-Mount 24mm Lens is one of two “G” brand lenses in our Sony lineup. The 24mm Lens is prime for handheld shots with a wider field of view, as it creates a large depth of field and fantastic bokeh with its low aperture of 1.4, and features a precise focus ring.",
                   imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Fredcubepdx%2F&psig=AOvVaw2nQECAIXzD3gS0iq-AUv5I&ust=1626878032363000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCODE0Yrv8fECFQAAAAAdAAAAABAJ",
                   bigImageURL: "LensBaby 56mm B 2"),
        
        LenseItem( name: "Sony E-Mount 85mm",
                   shortDescription: "High Focal Length Lens for Sony A7s II.",
                   longDescription: "Full Name: Sony E-Mount 85mm FE 1.4 Full Frame Lens. The E-Mount 85mm Lens is one of two “G” brand lenses in our Sony lineup. The 85mm Lens features the highest focal length of any lens in our lineup and is great for handheld shots and formal interview setups that require a tight “zoomed in” field of view. With the same high-quality focus ring and low aperture capability as the E-Mount 24mm Lens, the 85mm Lens captures fantastic images and videos.",
                   imageURL: "black",
                   bigImageURL: "rodeBgNew"),
        
        LenseItem( name: "Voigtlander Nokton 17.5mm",
                   shortDescription: "Medium Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 17.5mm F/ 0.95 LensThe Aspherical 17.5mm Lens is one of a collection of Voigtlander Lenses in our lineup, and offers crisp quality in a medium field of view. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 17.5mm is great for use on our Ronin gimbal and even for handheld shots.",
                   imageURL: "black",
                   bigImageURL: "rodeBgNew"),
        
        LenseItem( name: "Voigtlander Nokton 25mm",
                   shortDescription: "Medium Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 25mm F/0.95 Lens. The Aspherical 25mm Lens is one of a collection of Voigtlander Lenses in our lineup and offers crisp quality in a medium field of view, but slightly tighter than the 17.5mm. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 25mm is great for use on our Ronin gimbal and even for handheld shots.",
                   imageURL: "black",
                   bigImageURL: "black"),
        
        LenseItem( name: "Voigtlander Nokton 10mm",
                   shortDescription: "Low Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 10mm F/0.95 Lens for Lumix GH5 and GH5s. The Aspherical 10mm Lens is one of a collection of Voigtlander Lenses in our lineup, and offers crisp quality in the widest field of view out of all of our lenses. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 10mm is prime for use with our Lumix GH5s atop our Ronin gimbal.",
                   imageURL: "black",
                   bigImageURL: "rodeBgNew")
        
    ]
    
    
    static let computers = [
        ComputerItem(name: "iMac Pro",
                     shortDescription: "The two desktop computers that the club uses",
                     longDescription: "These powerful Apple computers are built for anything you need: animation, video or audio editing, graphic design, and research.",
                     imageURL: "black",
                     bigImageURL: "black")    ]
    
    
    static let audios = [
        AudioItem(name: "RODE CasterPro",
                  shortDescription: "Premium Podcast sound mixer used for recording podcastss.",
                  longDescription: "The RODECaster Pro is the premiere audio device for recording podcast audio. Element members have access to the powerful sound mixer to record multiple audio tracks simultaneously while adding audio effects live.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "RODE PodMic",
                  shortDescription: "Professional level Podcast microphones",
                  longDescription: "The RODE PodMic is a high quality microphone for podcast recordings. It delivers crisp, clean audio for the highest audio quality.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "RODE Lapel Mic",
                  shortDescription: "Personal microphones.",
                  longDescription: "RODE lapel mics are the best audio option for capturing audio for a specific subject. Maintaining the",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "Shure MV7",
                  shortDescription: "Premium Podcast Microphone",
                  longDescription: "The Shure MV7 is our most powerful podcast microphone. The MV7 delivers the best audio quality imaginable to give you a product on par with the pros.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "Shure SM7b",
                  shortDescription: "Standard Podcast Microphone",
                  longDescription: "The Shure SM7b is our standard podcast microphone, delivering high quality audio. The SM7b performs the regular tasks required to maintain a successful podcast.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "Shotgun Mic",
                  shortDescription: "Professional filmmaking microphones.",
                  longDescription: "Our shotgun mics are the same microphones thousands of professional filmmakers use to record audio for films and interviews. Members get to use these microphones to get a hands on experience with real world filmmaking tools.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "ZOOM",
                  shortDescription: "Portable audio recorder.",
                  longDescription: "The two ZOOM audio recorders we have are portable enough to be mobile, while also providing the high quality recording we need. Small enough to fit in your backpack, the ZOOMs have four XLR ports and an external microphone. Thanks to its versatility, the ZOOM is our go-to recorder.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "XLR Cable",
                  shortDescription: "XLR multi-use cable",
                  longDescription: "A regular XLR calbe, often used for a mutltitude of audio equipment",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "Headphones",
                  shortDescription: "AudioTechnica brand headphones. ",
                  longDescription: " Our over ear headphones are high quality audio devices. Approved for podcast recording and sound mixing, you won’t miss a beat with these.",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "MixPre",
                  shortDescription: "Professional audio recorder for filmmaking",
                  longDescription: "The MixPre is a recording device that delivers professional audio quality for filmmaking. With more tracks and easy sound manipulation, the MixPre is the best audio device for filmmaking.",
                  imageURL: "black",
                  bigImageURL: "black")
    ]
    
    
    static let miscs = [
        MiscItem(name: "DJI Mavic Pro",
                 shortDescription: "High-quality video drone",
                 longDescription: "The DJI Mavic Pro is a high-end video drone for getting cinematic shoots in the air.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "DJI Mavic Mini 2",
                 shortDescription: "Compact video drone",
                 longDescription: "The DJI Mavic Mini 2 is the ideal drone for on-the-go filming. Small yet powerful, the Mini 2 delivers quality video with a smaller load out. ",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Ronin",
                 shortDescription: "Mobile camera gimbal.",
                 longDescription: "The DJI Ronin is a camera gimbal that stabilizes your camera. The Ronin creates super smooth video for cinematic and high-quality videos.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Ronin S",
                 shortDescription: "Optimized mobile camera gimbal.",
                 longDescription: "This compact and improved Ronin offers a smaller build with even more features to aid filming.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Batteries",
                 shortDescription: "For multiple items.",
                 longDescription: "All batteries for our equipment are sorted by equipment type. Please recharge all batteries and return them to their proper location.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Tripods",
                 shortDescription: "Stabilizers for cameras and microphones.",
                 longDescription: "We have multiple tripods for both cameras and mics. Tripods are stationary stands for when you need to capture one moment or angle. ",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Mic Stands",
                 shortDescription: "Podcast microphone stands.",
                 longDescription: "Miscellaneous podcast stands to keep your mics in place. Our stands elevate your podcast experience to be more professional ",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Adapters/Dongles",
                 shortDescription: "Miscellaneous computer and equipment adaptors",
                 longDescription: "Each adaptor or dongle can be used to connect with certain equipment or wires.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "SD Cards",
                 shortDescription: "Memory cards",
                 longDescription: "Element often stores our audio and footage on SD cards for short-term movement before we download our work. Used in cameras and audio recorders",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Micro SD Card",
                 shortDescription: "Mini memory cards.",
                 longDescription: "Used in DJI Osmo and Mavic models, as well as miscellaneous equipment.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "USB C Cable",
                 shortDescription: "Common equipment cable.",
                 longDescription: "Often used in Apple products or computer products.",
                 imageURL: "black",
                 bigImageURL: "black"),
        
        MiscItem(name: "Extension Cable",
                 shortDescription: "Electrical extension cord.",
                 longDescription: "Used for recording and filming. Two 50 foot cables.",
                 imageURL: "black",
                 bigImageURL: "black")
        
    ]
}
