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
                            HStack {
                                Image(camera.imageURL)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 90)
                                    .cornerRadius(10)
                                  
                                
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(camera.name)
                                        .font(.title2)
                                        .fontWeight(.medium)
                                    
                                    Text(camera.shortDescription)
                                        .foregroundColor(.secondary)
                                        .fontWeight(.semibold)
                                }
                                .padding(5)
                                
                            }
                            .padding(7)
                        }
                    }
                }
           
                Section(header: Text("Computers")){
                    ForEach(MockData.computers) { computer in
                        NavigationLink(destination: ComputerItemDetailedView(computer: computer)) {
                        HStack {
                            Image(computer.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(10)
                                
                            VStack(alignment: .leading, spacing: 5) {
                                Text(computer.name)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Text(computer.shortDescription)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                            }
                            .padding(5)
                        }
                        .padding(5)
                        }
                    }
                }
                
                Section(header: Text("Audio")){
                    ForEach(MockData.audios) { audio in
                        NavigationLink(destination: AudioItemDetailedView(audio: audio)) {
                        HStack {
                            Image(audio.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(10)
                                
                            VStack(alignment: .leading, spacing: 5) {
                                Text(audio.name)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Text(audio.shortDescription)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                            }
                            .padding(5)
                        }
                        .padding(5)
                    }
                    }
                }
                
                Section(header: Text("Misc")){
                    ForEach(MockData.miscs) { misc in
                        NavigationLink(destination: MiscItemDetailedView(misc: misc)) {
                        HStack {
                            Image(misc.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(10)
                                
                            VStack(alignment: .leading, spacing: 5) {
                                Text(misc.name)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Text(misc.shortDescription)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                            }
                            .padding(5)
                        }
                        .padding(5)
                    }
                }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Equipment List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
    }
}

/*
 NavigationView{
     List(MockData.cameras) { camera in
         HStack {
             Image(camera.imageURL)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 120, height: 90)
                 .cornerRadius(8)
             VStack {
                 Text(camera.name)
                     .font(.title2)
                     .fontWeight(.medium)
                 
                 Text(camera.shortDescription)
                     .foregroundColor(.secondary)
                     .fontWeight(.semibold)
             }
         }
     }
     .navigationTitle("Equipment")
 }

 */
