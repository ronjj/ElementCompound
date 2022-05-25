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
                    imageURL: "https://dl.airtable.com/.attachmentThumbnails/18b8d9144920e163d3ce4e3e7fdafa98/76a71439",
                    bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/040ff5c94cee949daf531f699a14c00c/09ee94bc"),
        
        CameraItem(name: "Lumix GH5",
                   shortDescription: "4K Camera for Mid-Level Projects.",
                   longDescription: "The professional standard DSLR from Lumix, the GH5 captures high quality 4K video with improved settings and features over the GH4. With stronger built in stabilization, and compatibility with our professional suite of lenses, the GH5 is prime for more experienced student members working on Mid-Level Projects. ",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/454ce4e88cdc5e122fd89a07ee39dabd/3beb7a9d",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/0541533af1d3265ae024d51dbe768840/172b570b"),
        
        CameraItem (name: "Lumix GH5s",
                    shortDescription: "Optimized 4K Camera for High-Level Projects.",
                    longDescription: "The GH5s is one of the most powerful cameras in our equipment inventory. Optimized for low light conditions, the GH5s is a go-to camera for high-end projects. The camera has super-basic audio capabilities and can be customized with an assortment of lenses and gimbals.",
                    imageURL: "https://dl.airtable.com/.attachmentThumbnails/6ef9e9a755c55e0b21e11f4c59d432f4/9b281090",
                    bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/f39cc469040303716cb43dd44e664f9b/d8baf820"),
        
        CameraItem(name: "Sony A7SII",
                   shortDescription: "High-End 4K Camera for Experienced Students.",
                   longDescription: "As the most elite camera of Element, the Sony A7s Mark II is extremely versatile, and reserved for senior student members working on high-level projects. With its sensitive filter, the A7s II delivers smooth 4K video and dynamic, crisp performance in most lighting conditions. The A7s II shoots in full pixel readouts (RAW), allowing for complete quality control during editing.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/93c7544284baa3b93a28222399c2d1d7/0306615c",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/7a6b3ac1d9d363f22a3145b92f7203a6/7eda64e9"),
        
        CameraItem(name: "Ricoh Theta 360",
                   shortDescription: "360° Camera for Immersive Photos.",
                   longDescription: "The THETA 360° camera stitches two images from its dual lenses to create completely immersive 360° environments. THETA captures still images, panoramas, and videos, as seen throughout the Chaminade Virtual Tour. ",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/5f6ab21ed4669dc856fa74218e6b258e/da458e31",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/72b95a0d0924fee662d2ed36871e8101/4eeef35d"),
        
//        CameraItem(name: "Osmo Pocket",
//                   shortDescription: "Compact Action Camera for Simple Shoots.",
//                   longDescription: "The Osmo Pocket provides 1080p video in a super-compact form factor, mounted on a three-axis gimbal. The Osmo Pocket is prime for mobile shots, time-lapses, and panoramas. Its simplistic design allows users to store the Osmo easily and record video seamlessly.",
//                   imageURL: "GH5s I",
//                   bigImageURL: "GH5s I"),
        
        CameraItem(name: "Osmo Pocket Gen 2",
                   shortDescription: "Versatile Action Camera for Simple Shots.",
                   longDescription: "The Osmo Pocket 2 keeps the same compact design but adds new features and accessories to strengthen usability. The Osmo Pocket 2 comes with multiple bases, such as a standard base, or a mini tripod. The Osmo Pocket 2 adds audio capabilities to its old video modes, making it the perfect camera for mobile interviews.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/bcd884cad54bab31c8549c89dae8a9e8/a0cf6557",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/0c7b39972f61f2b1b617749abd9eaab5/84d5971d"),
        
        
    ]
       
    
    
    static let lenses = [
        
        // E - Mount / Sony Lenses
        
        LenseItem( name: "Voigtlander 10mm Fisheye ",
                   shortDescription: "Hyper-Wide Focal Length Lens for Sony A7s II",
                   longDescription: "Full name: Voigtlander Nokton Aspherical “Hyper-Wide” F/5.6 10mm Fisheye Lens. The only E-Mount Voigtlander Nokton Lens in our collection, this 10mm variant captures extremely wide shots (130 degree angle of view), courtesy of its “Fisheye” construction. With the same structure as all of our Voigtlander lenses, the 10mm Fisheye Lens is best used for stylized wide shots with a tripod.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/d5d8eedaf3eacd7433dd3088761a0429/8d5a7791",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/a698443ca9ae32bfd33e67332627eaf2/82251899"),
        
        LenseItem( name: "Sony 24mm",
                   shortDescription: "Medium Focal Length Lens for Sony A7s II.",
                   longDescription: "Full Name: Sony E-Mount 24mm FE 1.4 Full Frame Lens. The E-Mount 24mm Lens is one of two “G” brand lenses in our Sony lineup. The 24mm Lens is prime for handheld shots with a wider field of view, as it creates a large depth of field and fantastic bokeh with its low aperture of 1.4, and features a precise focus ring.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/0df1e0d66cf1988b0032c51bcbc4025c/dc988328",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/6c61f261f08de7862d62033bfc660005/1dc2f290"),
        
        LenseItem( name: "Carl Zeiss 35mm ",
                   shortDescription: "Medium Focal Length Lens for Sony A7s II",
                   longDescription: "Full Name: Carl Zeiss Sonnar F/2.8 FE 35mm Lens. The E-Mount 35mm Lens from Carl Zeiss is a compact option for the A7s II. With an aperture of 2.8, its depth of field capability is not as large as other lenses in our collection, but its small form factor and large focus ring provide a general ease of use, and its sharp quality is great for interview shots and simple handheld setups",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/b47d9180f1e7f2428b03c1d59a7417cd/0c4c3c6f",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/40c92e3740560b7ce83f5449a514e2a1/6fd399d7"),
        
        LenseItem( name: "Lensbaby 56mm ",
                   shortDescription: "High Focal Length Lens for Sony A7s II",
                   longDescription: "Full Name: Lensbaby Velvet 56mm F/1.6 Lens. The 56mm Lens from Lensbaby is highly stylized, as its unique construction captures soft and dream-like images and videos. The low aperture of 1.6 creates a large depth of field, which is amplified by the soft image quality. The 56mm Lens is best for specific shots, and is better suited for photography.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/d36788e9fe3400325576cc065422078f/5d9f126d",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/e98750aae956bdd3780ec612f778aefc/bd43c9b9"),
        
        LenseItem( name: "Sony 85mm",
                   shortDescription: "High Focal Length Lens for Sony A7s II.",
                   longDescription: "Full Name: Sony E-Mount 85mm FE 1.4 Full Frame Lens. The E-Mount 85mm Lens is one of two “G” brand lenses in our Sony lineup. The 85mm Lens features the highest focal length of any lens in our lineup and is great for handheld shots and formal interview setups that require a tight “zoomed in” field of view. With the same high-quality focus ring and low aperture capability as the E-Mount 24mm Lens, the 85mm Lens captures fantastic images and videos.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/106c6d51d02cf0555871112a38e75212/7994eeef",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/e1d98527de00a66e05a170938be2fec7/a2c5706f"),
        
       
        
        //M43 / Lumix Lenses
        
        LenseItem( name: "Voigtlander 10.5mm",
                   shortDescription: "Low Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 10mm F/0.95 Lens for Lumix GH5 and GH5s. The Aspherical 10mm Lens is one of a collection of Voigtlander Lenses in our lineup, and offers crisp quality in the widest field of view out of all of our lenses. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 10mm is prime for use with our Lumix GH5s atop our Ronin gimbal.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/d5d8eedaf3eacd7433dd3088761a0429/8d5a7791",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/a698443ca9ae32bfd33e67332627eaf2/82251899"),
        
        LenseItem( name: "Voigtlander 17.5mm",
                   shortDescription: "Medium Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 17.5mm F/ 0.95 LensThe Aspherical 17.5mm Lens is one of a collection of Voigtlander Lenses in our lineup, and offers crisp quality in a medium field of view. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 17.5mm is great for use on our Ronin gimbal and even for handheld shots.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/0566ba8e7e75f53d20c714d2d3d7c23f/a2aad911",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/97efa04085c9a5353fdfd21d176e243a/3cdc81c0"),
        
        LenseItem( name: "Voigtlander 25mm",
                   shortDescription: "Medium Focal Length Lens for Lumix GH5 and GH5s.",
                   longDescription: "Full Name: Voigtlander Nokton Aspherical 25mm F/0.95 Lens. The Aspherical 25mm Lens is one of a collection of Voigtlander Lenses in our lineup and offers crisp quality in a medium field of view, but slightly tighter than the 17.5mm. With a precise focus ring and a large depth of field, courtesy of its low aperture of 0.95, the 25mm is great for use on our Ronin gimbal and even for handheld shots.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/128344fce092acbbcaa9d6a8b8e75927/12106c19",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/cf5bc0ec6dd456905944d7511090cfab/9d953bb2"),
        
    
        LenseItem( name: "Rokinon 50mm",
                   shortDescription: "Medium Focal Length Lens for Sony A7s II",
                   longDescription: "Full Name:Rokinon AF F/1.4 FE 50mm Lens. The E-Mount Rokinon 50mm Lens provides a nice focal midpoint between our two “G” brand lenses. The low aperture of 1.4 creates a large depth of field, and though not as drastic as both “G” lenses. The large focus ring allows for smooth and finite focus adjustments, and makes this 50mm lens prime for handheld shots of fast moving subjects.",
                   imageURL: "https://dl.airtable.com/.attachmentThumbnails/c8e4f9a35a4601b3ca7f958a511a545f/53d2e194",
                   bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/68494c1783e9827707a6dde7df0fe787/6466a154"),
        
 
    ]
    
    
    static let computers = [
        ComputerItem(name: "iMac Pro",
                     shortDescription: "The two desktop computers that the club uses",
                     longDescription: "These powerful Apple computers are built for anything you need: animation, video or audio editing, graphic design, and research.",
                     imageURL: "https://dl.airtable.com/.attachmentThumbnails/430aa6f99b03d00d66cf3072ede36dd7/b63a204f",
                     bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/9f33c30552fcea00986735110519a5bd/25f35a8e")    ]
    
    
    static let audios = [
        
        
        AudioItem(name: "RODE CasterPro",
                  shortDescription: "Premium Podcast sound mixer used for recording podcastss.",
                  longDescription: "The RODECaster Pro is the premiere audio device for recording podcast audio. Element members have access to the powerful sound mixer to record multiple audio tracks simultaneously while adding audio effects live.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/b71028fc5f4164f1b2806cec899320b9/d7febe70",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/903a40b4dd1306e4f8050d280b41e10d/5dca830b"),
        
        AudioItem(name: "RODE PodMic",
                  shortDescription: "Professional level Podcast microphones",
                  longDescription: "The RODE PodMic is a high quality microphone for podcast recordings. It delivers crisp, clean audio for the highest audio quality.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/4897e1323e1ff49c4c13e6258ec0420b/70b8b0db",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/9d730ea26735605c85d4dc2e5514e4d0/37b0fd96"),
        
//        AudioItem(name: "RODE Lapel Mic",
//                  shortDescription: "Personal microphones.",
//                  longDescription: "RODE lapel mics are the best audio option for capturing audio for a specific subject. Maintaining the",
//                  imageURL: "black",
//                  bigImageURL: "black"),
        
        AudioItem(name: "Lapel Microphone",
                  shortDescription: "A small microphone that clips to a person’s shirt lapel.",
                  longDescription: "Also known as ‘lavalier microphones’, lapel mics are often used when we are recording someone speaking. They are small and black so they have a low profile on a person’s shirt.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/21c09596fce0dd25a3ff8510a150477d/d1ecc461",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/ef44d86f953db11a599ac1457bfab435/99256dc6"),
        
        
        AudioItem(name: "Shure MV7",
                  shortDescription: "Standard Podcast Microphone",
                  longDescription: "The Shure MV7 is our standard podcast microphone, delivering high quality audio. The  MV7 performs the regular tasks required to maintain a successful podcast",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/4135cc1259d98eb423834711e48a6b60/e582c666",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/8521999e91cf76686b553de0439ef41e/4773c2d0"),
        
        
        
//        AudioItem(name: "Shure SM7b",
//                  shortDescription: "Premium Podcast Microphone",
//                  longDescription: "The Shure SM7b is our most powerful podcast microphone. The SM7b delivers the best audio quality imaginable to give you a product on par with the pros",
//                  imageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/eb4360c3-b3d9-45ab-96e8-18684f2ee795",
//                  bigImageURL: "https://www.chaminade-hs.org/fs/resource-manager/view/349db703-95be-4351-a89b-db55cdd55c88"),
        
        AudioItem(name: "Shotgun Mic",
                  shortDescription: "Professional filmmaking microphones.",
                  longDescription: "Our shotgun mics are the same microphones thousands of professional filmmakers use to record audio for films and interviews. Members get to use these microphones to get a hands on experience with real world filmmaking tools.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/5d1a1f842fd41f327e6a5fb171e77c1b/3c4e295f",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/8439bf48e3a576ee3510af6653a12087/0348995b"),
        
        AudioItem(name: "ZOOM",
                  shortDescription: "Portable audio recorder.",
                  longDescription: "The two ZOOM audio recorders we have are portable enough to be mobile, while also providing the high quality recording we need. Small enough to fit in your backpack, the ZOOMs have four XLR ports and an external microphone. Thanks to its versatility, the ZOOM is our go-to recorder.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/8186fe7f740b62ac290976f0ce7c4dd7/c586d979",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/5a4384bbf6e66664d0ef296cc4cb6291/745a9b55"),
        
        AudioItem(name: "XLR Cable",
                  shortDescription: "XLR multi-use cable",
                  longDescription: "A regular XLR calbe, often used for a mutltitude of audio equipment",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/9d7f399308ff0e4f842d2f4b6f1f6bdc/01ec1ef6",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/7f479ee4f1f97095bf9ce2c30dfc26be/f8fd88eb"),
        
        AudioItem(name: "Headphones",
                  shortDescription: "AudioTechnica brand headphones. ",
                  longDescription: " Our over ear headphones are high quality audio devices. Approved for podcast recording and sound mixing, you won’t miss a beat with these.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/5fe8bb1636a0b2d742e03d282cd32099/4b20371c",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/df32298fdc64859edf8651db2de2781f/de76cc80"),
        
        AudioItem(name: "MixPre",
                  shortDescription: "Professional audio recorder for filmmaking",
                  longDescription: "The MixPre is a recording device that delivers professional audio quality for filmmaking. With more tracks and easy sound manipulation, the MixPre is the best audio device for filmmaking.",
                  imageURL: "https://dl.airtable.com/.attachmentThumbnails/984196c0bb051705db140930f4521e30/36a1dd66",
                  bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/eaffafee37a0ab23b60a7b7dc15ad408/a60ed52f")
        
        
    ]
    
    
    static let miscs = [
        MiscItem(name: "DJI Mavic Pro",
                 shortDescription: "High-quality video drone",
                 longDescription: "The DJI Mavic Pro is a high-end video drone for getting cinematic shoots in the air.",
                 imageURL: "https://dl.airtable.com/.attachmentThumbnails/eda3eeba44a9ca7865892c06ce9c08df/c37a8e19",
                 bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/e5cb8c576979c58f0f43e10a334f1c0c/016cb82e"),
        
        MiscItem(name: "DJI Mavic Mini 2",
                 shortDescription: "Compact video drone",
                 longDescription: "The DJI Mavic Mini 2 is the ideal drone for on-the-go filming. Small yet powerful, the Mini 2 delivers quality video with a smaller load out. ",
                 imageURL: "https://dl.airtable.com/.attachmentThumbnails/986e1ba19f5b56d0360ec06fcf2edf22/e76db0f9",
                 bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/b876c7b88fa146744c89e035e14bb839/94492967"),
        
        MiscItem(name: "Ronin and Ronin S",
                 shortDescription: "Mobile camera gimbal.",
                 longDescription: "The DJI Ronin is a camera gimbal that stabilizes your camera. The Ronin creates super smooth video for cinematic and high-quality videos.",
                 imageURL: "https://dl.airtable.com/.attachmentThumbnails/8b5beaa7378cfcb0e0cca8a75c4402b3/c985a2ca",
                 bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/f77cbd5ad3bb478fedb26616602e4503/05b3b622"),
   
        MiscItem(name: "Mic Stands",
                 shortDescription: "Podcast microphone stands.",
                 longDescription: "Miscellaneous podcast stands to keep your mics in place. Our stands elevate your podcast experience to be more professional ",
                 imageURL: "https://dl.airtable.com/.attachmentThumbnails/8a38e2e9db008686fac7ced919d12016/e484bb44",
                 bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/0714d86f65129354b19ae15f93133cee/a991c090"),
        
        MiscItem(name: "Adapters, Batteries, Cables, & SD Cards",
                 shortDescription: "Smaller pieces of equipment that are needed for daily operation.",
                 longDescription: "Although these items are smaller, they still play an important role in the office. They are often crucial when recording or in post-production. It’s very important to make sure these items are put back where they are found because they are easy to lose and others will need to use them as well.",
                 imageURL: "https://dl.airtable.com/.attachmentThumbnails/f9374f5c98138aaf5c65069894c69e11/5a340ea7",
                 bigImageURL: "https://dl.airtable.com/.attachmentThumbnails/496c68d3e4b639ac42f83e9ec97030d9/2226e24a"),
    
        
    ]
}
