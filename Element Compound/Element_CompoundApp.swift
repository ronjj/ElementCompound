//
//  Element_CompoundApp.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import SwiftUI

@main
struct Element_CompoundApp: App {
    var body: some Scene {
        WindowGroup {
            InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
        }
    }
}
