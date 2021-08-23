//
//  ContentView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import SwiftUI

struct InventoryIconView: View {
    
    @State var searchText = ""
   
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.ruby.edgesIgnoringSafeArea(.all)
                
                ScrollView{
               
                    
                    LazyVStack{
                        Group{
                            HStack{
                                
                                Text("Cameras")
                                    .foregroundColor(Color.bginv)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .padding()
                                
                                Spacer()
                            }
                            
                            ForEach(MockData.cameras.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { camera in
                                NavigationLink(destination: CameraItemDetailedView5(camera: camera)) {
                                    InventoryListCellView(images: camera.imageURL, title: camera.name, description: camera.shortDescription, color: Color.nyanza)
     
                                }
                                .padding(5)
                            }
                            
                            HStack{
                                
                                Text("Lenses")
                                    .foregroundColor(Color.bginv)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .padding()
                                
                                Spacer()
                            }
                            
                            ForEach(MockData.lenses.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { lense in
                                NavigationLink(destination: LenseItemDetailedView(lense: lense)) {
                                    InventoryListCellView(images: lense.imageURL, title: lense.name, description: lense.shortDescription, color: Color.nyanza)
     
                                }
                                .padding(5)
                            }
        
                            HStack{
                                Text("Computers")
                                    .foregroundColor(Color.bginv)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .padding()
                                    .padding(.top, 20)
                                
                                Spacer()
                            }
                            ForEach(MockData.computers.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { computer in
                                NavigationLink(destination: ComputerItemDetailedView(computer: computer)) {
                                    InventoryListCellView(images: computer.imageURL, title: computer.name, description: computer.shortDescription, color: Color.ruby)
                                }
                            }
                            
                            
                            HStack{
                                Text("Audio")
                                    .foregroundColor(Color.bginv)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .padding()
                                    .padding(.top, 20)
                                
                                Spacer()
                            }
                            ForEach(MockData.audios.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { audio in
                                NavigationLink(destination: AudioItemDetailedView(audio: audio)) {
                                    InventoryListCellView(images: audio.imageURL, title: audio.name, description: audio.shortDescription, color: Color.yellow2)
     
                                }
                                .padding(5)
                            }
                            
                            
                            HStack{
                                Text("Misc")
                                    .foregroundColor(Color.bginv)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .padding()
                                    .padding(.top, 20)
                                
                                
                                Spacer()
                            }
                            ForEach(MockData.miscs.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { misc in
                                NavigationLink(destination: MiscItemDetailedView(misc: misc)) {
                                    InventoryListCellView(images: misc.imageURL, title: misc.name, description: misc.shortDescription, color: Color.independence)
                                }
                                .padding(5)
                            }
                        
                        }
                        HStack{
                            Text(" ")
                                .foregroundColor(Color.lightBlue)
                                .fontWeight(.bold)
                                .font(.title2)
                                .padding()
                                .padding(.top, 20)
                            
                            Spacer()
                        }
                     
                        
                    }
                    .navigationTitle("Equipment List")
                    .navigationBarHidden(true)
                }
                .background(Color.ruby)
                .navigationBarHidden(true)
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}




























//
//    var body: some View {
//        NavigationView {
//            ZStack{
//                Color.lightBlue.edgesIgnoringSafeArea(.all)
//
//
//                VStack{
//                SearchBar(text: $searchText)
//                    .padding(.top, 15)
//                    .padding(.bottom, 5)
//
//                List{
////                    Section(header: Text("Cameras")){
////                        ForEach(MockData.cameras.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { camera in
////                            NavigationLink(destination: CameraItemDetailedView(camera: camera)) {
////                                InventoryListCellView(image: camera.imageURL, title: camera.name, description: camera.shortDescription)
////                                    .padding(7)
////                            }
////                        }
////                    }
//
//                    Section(header: Text("Cameras")){
//                        ForEach(MockData.cameras.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { camera in
//                            NavigationLink(destination: CameraDetailView4(camera: camera)) {
//                                InventoryListCellView(image: camera.imageURL, title: camera.name, description: camera.shortDescription)
//                                    .padding(7)
//                            }
//                        }
//                    }
//
//                    Section(header: Text("Computers")){
//                        ForEach(MockData.computers.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { computer in
//                            NavigationLink(destination: ComputerItemDetailedView(computer: computer)) {
//                                InventoryListCellView(image: computer.imageURL, title: computer.name, description: computer.shortDescription)
//                                    .padding(5)
//                            }
//                        }
//                    }
//
//                    Section(header: Text("Audio")){
//                        ForEach(MockData.audios.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { audio in
//                            NavigationLink(destination: AudioItemDetailedView(audio: audio)) {
//                                InventoryListCellView(image: audio.imageURL, title: audio.name, description: audio.shortDescription)
//                                    .padding(5)
//                            }
//                        }
//                    }
//
//                    Section(header: Text("Misc")){
//                        ForEach(MockData.miscs.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { misc in
//                            NavigationLink(destination: MiscItemDetailedView(misc: misc)) {
//                                InventoryListCellView(image: misc.imageURL, title: misc.name, description: misc.shortDescription)
//
//                            }
//                            .padding(5)
//                        }
//                    }
//                }
//
//                .listStyle(InsetGroupedListStyle())
//                .navigationTitle("Equipment List")
//            }
//                .background(Color.red)
//            }
//
//        }
//    }
//}
//
