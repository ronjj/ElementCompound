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
                    longDescription: "The go-to camera for new student members, the GH4 is a reliable and durable camera that captures professional-quality video. The GH4 is equipped with 4K and HD capability for video, basic audio recording, and can be used with a variety of entry-level lenses",
                    imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/f92aa4ab-876f-4a7b-8e51-7d17f28d0445",
                    bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/2607cfa5-efcc-46fe-8404-c80ed55339e8"),
        
        CameraItem(name: "Lumix GH5",
                   shortDescription: "4K Camera for Mid-Level Projects.",
                   longDescription: "The professional standard DSLR from Lumix, the GH5 captures high quality 4K video with improved settings and features over the GH4. With stronger built in stabilization, and compatibility with our professional suite of lenses, the GH5 is prime for more experienced student members working on Mid-Level Projects. ",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/c54522c9-6398-4a74-bd8a-4aed17f248cf",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/54b13970-e4fa-4515-8efd-117b6da6ed04"),
        
        CameraItem( name: "Lumix GH5s",
                    shortDescription: "Optimized 4K Camera for High-Level Projects.",
                    longDescription: "The GH5s is one of the most powerful cameras in our equipment inventory. Optimized for low light conditions, the GH5s is a go-to camera for high-end projects. The camera has super-basic audio capabilities and can be customized with an assortment of lenses and gimbals.",
                    imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/b023fc25-4137-4cad-b20b-f41b8c933966",
                    bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/89f44cd4-19c0-4651-be41-b8ef7ebbb0a5"),
        
        CameraItem(name: "Sony A7SII",
                   shortDescription: "High-End 4K Camera for Experienced Students.",
                   longDescription: "As the most elite camera of Element, the Sony A7s Mark II is extremely versatile, and reserved for senior student members working on high-level projects. With its sensitive filter, the A7s II delivers smooth 4K video and dynamic, crisp performance in most lighting conditions. The A7s II shoots in full pixel readouts (RAW), allowing for complete quality control during editing.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/51a10c04-2182-4201-83b3-8a088b704332",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/6288119a-8171-4d52-a6ed-c9a0b84cef59"),
        
        CameraItem(name: "Ricoh Theta 360",
                   shortDescription: "360° Camera for Immersive Photos.",
                   longDescription: "The THETA 360° camera stitches two images from its dual lenses to create completely immersive 360° environments. THETA captures still images, panoramas, and videos, as seen throughout the Chaminade Virtual Tour. ",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/a3de47cb-7284-4e7d-ad70-0f3deecab808",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/01f64d09-3e6a-4a98-9a9a-2311f049cbee"),
        
//        CameraItem(name: "Osmo Pocket",
//                   shortDescription: "Compact Action Camera for Simple Shoots.",
//                   longDescription: "The Osmo Pocket provides 1080p video in a super-compact form factor, mounted on a three-axis gimbal. The Osmo Pocket is prime for mobile shots, time-lapses, and panoramas. Its simplistic design allows users to store the Osmo easily and record video seamlessly.",
//                   imageURL: "GH5s I",
//                   bigImageURL: "GH5s I"),
        
        CameraItem(name: "Osmo Pocket Gen 2",
                   shortDescription: "Versatile Action Camera for Simple Shots.",
                   longDescription: "The Osmo Pocket 2 keeps the same compact design but adds new features and accessories to strengthen usability. The Osmo Pocket 2 comes with multiple bases, such as a standard base, or a mini tripod. The Osmo Pocket 2 adds audio capabilities to its old video modes, making it the perfect camera for mobile interviews.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/997a3274-2447-4327-a9e6-7a3e2ba664f2",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/64c2de44-4092-4b2c-bbc0-2cbf6bfb302e"),
        
        
    ]
       
    
    
    static let lenses = [
        LenseItem( name: "Sony E-Mount 24mm",
                   shortDescription: "Medium Focal Length Lens for Sony A7s II.",
                   longDescription: "Full Name: Sony E-Mount 24mm FE 1.4 Full Frame Lens. The E-Mount 24mm Lens is one of two “G” brand lenses in our Sony lineup. The 24mm Lens is prime for handheld shots with a wider field of view, as it creates a large depth of field and fantastic bokeh with its low aperture of 1.4, and features a precise focus ring.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/50005e56-6f37-42b1-ae96-9283f1c9e1f9",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/24d5a2bf-9fb1-49db-834f-2308d10a882d"),
        
        LenseItem( name: "Sony E-Mount 85mm",
                   shortDescription: "High Focal Length Lens for Sony A7s II.",
                   longDescription: "Full Name: Sony E-Mount 85mm FE 1.4 Full Frame Lens. The E-Mount 85mm Lens is one of two “G” brand lenses in our Sony lineup. The 85mm Lens features the highest focal length of any lens in our lineup and is great for handheld shots and formal interview setups that require a tight “zoomed in” field of view. With the same high-quality focus ring and low aperture capability as the E-Mount 24mm Lens, the 85mm Lens captures fantastic images and videos.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/f0f622a8-02c0-4f37-a2c1-0cc1273ec912",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/d50f8aa5-633c-4031-bab1-c0c8c85256c6"),
        
        LenseItem( name: "Voigtlander Nokton 17.5mm",
                   shortDescription: "Medium Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 17.5mm F/ 0.95 LensThe Aspherical 17.5mm Lens is one of a collection of Voigtlander Lenses in our lineup, and offers crisp quality in a medium field of view. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 17.5mm is great for use on our Ronin gimbal and even for handheld shots.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/1b9a3f66-8ed8-4c0b-8e4d-3c1984a19040",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/abdf6bf2-e765-42a4-97ea-29921d61b88a"),
        
        LenseItem( name: "Voigtlander Nokton 25mm",
                   shortDescription: "Medium Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 25mm F/0.95 Lens. The Aspherical 25mm Lens is one of a collection of Voigtlander Lenses in our lineup and offers crisp quality in a medium field of view, but slightly tighter than the 17.5mm. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 25mm is great for use on our Ronin gimbal and even for handheld shots.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/c74a2b25-a099-4321-aee5-28c6dbb5de56",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/ab45689a-75c6-4c72-8f87-03cc5e2b3aa4"),
        
        LenseItem( name: "Voigtlander Nokton 10.5mm",
                   shortDescription: "Low Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 10mm F/0.95 Lens for Lumix GH5 and GH5s. The Aspherical 10mm Lens is one of a collection of Voigtlander Lenses in our lineup, and offers crisp quality in the widest field of view out of all of our lenses. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 10mm is prime for use with our Lumix GH5s atop our Ronin gimbal.",
                   imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/31b5aaa6-cea8-481d-a300-d7fa91e4eded",
                   bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/06fc7dd8-e526-4187-968a-af5dcf51dfc0")
        
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
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/694388b6-664c-4dcf-9276-622115e16f19",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/8aad1aa8-44c4-48de-a6cc-7f078723f502"),
        
        AudioItem(name: "RODE PodMic",
                  shortDescription: "Professional level Podcast microphones",
                  longDescription: "The RODE PodMic is a high quality microphone for podcast recordings. It delivers crisp, clean audio for the highest audio quality.",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/d3f42f19-a974-46d8-a225-a133d6bfa031",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/058e882d-7e2a-4046-8a95-7b8790dcfec3"),
        
        AudioItem(name: "RODE Lapel Mic",
                  shortDescription: "Personal microphones.",
                  longDescription: "RODE lapel mics are the best audio option for capturing audio for a specific subject. Maintaining the",
                  imageURL: "black",
                  bigImageURL: "black"),
        
        AudioItem(name: "Shure MV7",
                  shortDescription: "Standard Podcast Microphone",
                  longDescription: "The Shure MV7 is our standard podcast microphone, delivering high quality audio. The  MV7 performs the regular tasks required to maintain a successful podcast",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/1714452b-af76-4a36-aaed-82dc0b9f59c4",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/aae9ea30-2eb1-41b4-ba77-123d10ed1a54"),
        
        AudioItem(name: "Shure SM7b",
                  shortDescription: "Premium Podcast Microphone",
                  longDescription: "The Shure SM7b is our most powerful podcast microphone. The SM7b delivers the best audio quality imaginable to give you a product on par with the pros",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/eb4360c3-b3d9-45ab-96e8-18684f2ee795",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/349db703-95be-4351-a89b-db55cdd55c88"),
        
        AudioItem(name: "Shotgun Mic",
                  shortDescription: "Professional filmmaking microphones.",
                  longDescription: "Our shotgun mics are the same microphones thousands of professional filmmakers use to record audio for films and interviews. Members get to use these microphones to get a hands on experience with real world filmmaking tools.",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/172802e8-3ed0-4658-a98e-19c1e1663562",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/1d61f5d9-60b3-4347-a9dc-aa5a36b09bf1"),
        
        AudioItem(name: "ZOOM",
                  shortDescription: "Portable audio recorder.",
                  longDescription: "The two ZOOM audio recorders we have are portable enough to be mobile, while also providing the high quality recording we need. Small enough to fit in your backpack, the ZOOMs have four XLR ports and an external microphone. Thanks to its versatility, the ZOOM is our go-to recorder.",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/5b02da22-8ecb-4ea7-bc00-74163504d19a",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/83096610-cdbd-4608-9db3-8a77bc0517d1"),
        
        AudioItem(name: "XLR Cable",
                  shortDescription: "XLR multi-use cable",
                  longDescription: "A regular XLR calbe, often used for a mutltitude of audio equipment",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/08c5ce83-07ef-4a07-8c1e-5ae057e2e341",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/d2670343-0525-444b-a1e2-964879c4bb25"),
        
        AudioItem(name: "Headphones",
                  shortDescription: "AudioTechnica brand headphones. ",
                  longDescription: " Our over ear headphones are high quality audio devices. Approved for podcast recording and sound mixing, you won’t miss a beat with these.",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/352466a4-048a-4ba6-9697-e26b388f276c",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/a2342850-aa41-4ca0-b015-7a9f32018c6b"),
        
        
        
        AudioItem(name: "MixPre",
                  shortDescription: "Professional audio recorder for filmmaking",
                  longDescription: "The MixPre is a recording device that delivers professional audio quality for filmmaking. With more tracks and easy sound manipulation, the MixPre is the best audio device for filmmaking.",
                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/e326b48c-0b49-43ce-990c-e36a750dc757",
                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/3dd086cf-0d1f-4bb9-a5a2-cbaeee8d7cad")
        
        
    ]
    
    
    static let miscs = [
        MiscItem(name: "DJI Mavic Pro",
                 shortDescription: "High-quality video drone",
                 longDescription: "The DJI Mavic Pro is a high-end video drone for getting cinematic shoots in the air.",
                 imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/6e50ea39-e879-46e4-8f09-8ab0da7de85b",
                 bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/d3932fe1-2701-4489-a938-50e64d0a77f7"),
        
        MiscItem(name: "DJI Mavic Mini 2",
                 shortDescription: "Compact video drone",
                 longDescription: "The DJI Mavic Mini 2 is the ideal drone for on-the-go filming. Small yet powerful, the Mini 2 delivers quality video with a smaller load out. ",
                 imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/cc0df01f-de9b-414a-aab3-3196ce121c9b",
                 bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/5b977b42-1f55-4d36-a7d6-83ea50ece58d"),
        
        MiscItem(name: "Ronin and Ronin S",
                 shortDescription: "Mobile camera gimbal.",
                 longDescription: "The DJI Ronin is a camera gimbal that stabilizes your camera. The Ronin creates super smooth video for cinematic and high-quality videos.",
                 imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/c140ca88-3a64-491e-84a4-5b35805520dc",
                 bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/60c55ef0-76f5-41b3-b491-8ad6f2d70ff5"),
   
        MiscItem(name: "Mic Stands",
                 shortDescription: "Podcast microphone stands.",
                 longDescription: "Miscellaneous podcast stands to keep your mics in place. Our stands elevate your podcast experience to be more professional ",
                 imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/9f91ec27-896c-403a-a825-95d460ea20f3",
                 bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/2b3581ac-0850-4996-b4a3-2ea96fdabc1e"),
    
        
    ]
}
