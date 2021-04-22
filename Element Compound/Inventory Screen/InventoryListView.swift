//
//  ContentView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import SwiftUI

struct InventoryListView: View {
    
    
    @State var searchText = ""
    
    let camera: CameraItem
    let computer: ComputerItem
    let audio: AudioItem
    let misc: MiscItem
    
    var body: some View {
        
        NavigationView {
            VStack{
                SearchBar(text: $searchText)
                    .padding(.top, 15)
                    .padding(.bottom, 5)
                
    
                
                List{
                    Section(header: Text("Cameras")){
                        ForEach(MockData.cameras.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { camera in
                            NavigationLink(destination: CameraItemDetailedView(camera: camera)) {
                                InventoryListCellView(image: camera.imageURL, title: camera.name, description: camera.shortDescription)
                                    .padding(7)
                            }
                        }
                    }
                    
                    Section(header: Text("Computers")){
                        ForEach(MockData.computers.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { computer in
                            NavigationLink(destination: ComputerItemDetailedView(computer: computer)) {
                                InventoryListCellView(image: computer.imageURL, title: computer.name, description: computer.shortDescription)
                                    .padding(5)
                            }
                        }
                    }
                    
                    Section(header: Text("Audio")){
                        ForEach(MockData.audios.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { audio in
                            NavigationLink(destination: AudioItemDetailedView(audio: audio)) {
                                InventoryListCellView(image: audio.imageURL, title: audio.name, description: audio.shortDescription)
                                    .padding(5)
                            }
                        }
                    }
                    
                    Section(header: Text("Misc")){
                        ForEach(MockData.miscs.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { misc in
                            NavigationLink(destination: MiscItemDetailedView(misc: misc)) {
                                InventoryListCellView(image: misc.imageURL, title: misc.name, description: misc.shortDescription)
                                
                            }
                            .padding(5)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Equipment List")
            }
        }
    }
}

//struct InventoryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        InventoryListView(searchText: "text", camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
//    }
//}


//struct SearchBar: View {
//
//    @Binding var searchText: String
//    @Binding var isSearching: Bool
//
//    var body: some View {
//        HStack {
//            HStack {
//                TextField("Search terms here", text: $searchText)
//                    .padding(.leading, 24)
//            }
//            .padding()
//            .background(Color(.systemGray5))
//            .cornerRadius(6)
//            .padding(.horizontal)
//            .onTapGesture(perform: {
//                isSearching = true
//            })
//            .overlay(
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                    Spacer()
//
//                    if isSearching {
//                        Button(action: { searchText = "" }, label: {
//                            Image(systemName: "xmark.circle.fill")
//                                .padding(.vertical)
//                        })
//
//                    }
//
//                }.padding(.horizontal, 32)
//                .foregroundColor(.gray)
//            ).transition(.move(edge: .trailing))
//            .animation(.spring())
//
//            if isSearching {
//                Button(action: {
//                    isSearching = false
//                    searchText = ""
//
//                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//
//                }, label: {
//                    Text("Cancel")
//                        .padding(.trailing)
//                        .padding(.leading, 0)
//                })
//                .transition(.move(edge: .trailing))
//                .animation(.spring())
//            }
//
//        }
//    }
//}
