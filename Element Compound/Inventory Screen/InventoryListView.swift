//
//  ContentView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import SwiftUI

struct InventoryListView: View {
    
    let camera: CameraItem
    let computer: ComputerItem
    let audio: AudioItem
    let misc: MiscItem
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Cameras")){
                    ForEach(MockData.cameras) { camera in
                        NavigationLink(destination: CameraItemDetailedView(camera: camera)) {
                            InventoryListCellView(image: camera.imageURL, title: camera.name, description: camera.shortDescription)
                            .padding(7)
                        }
                    }
                }
           
                Section(header: Text("Computers")){
                    ForEach(MockData.computers) { computer in
                        NavigationLink(destination: ComputerItemDetailedView(computer: computer)) {
                            InventoryListCellView(image: computer.imageURL, title: computer.name, description: computer.shortDescription)
                                .padding(5)
                        }
                    }
                }
                
                Section(header: Text("Audio")){
                    ForEach(MockData.audios) { audio in
                        NavigationLink(destination: AudioItemDetailedView(audio: audio)) {
                            InventoryListCellView(image: audio.imageURL, title: audio.name, description: audio.shortDescription)
                                .padding(5)
                        }
                    }
                }
                
                Section(header: Text("Misc")){
                    ForEach(MockData.miscs) { misc in
                        NavigationLink(destination: MiscItemDetailedView(misc: misc)) {
                            InventoryListCellView(image: misc.imageURL, title: misc.name, description: misc.shortDescription)
  
                        }
                        .padding(5)
                    }
                }
            }
            .navigationTitle("Equipment List")
        }
        .listStyle(SidebarListStyle())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
    }
}


