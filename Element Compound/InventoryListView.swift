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
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Cameras")){
                    ForEach(MockData.cameras) { camera in
                        HStack {
                            Image(camera.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                              
                            
                            
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
                        .padding(5)
                    }
                }
           
                Section(header: Text("Computers")){
                    ForEach(MockData.computers) { computer in
                        HStack {
                            Image(computer.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                
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
            .listStyle(SidebarListStyle())
            .navigationTitle("Equipment List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer)
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
