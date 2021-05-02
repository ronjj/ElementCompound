//
//  Home.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeView: View {
    
    @State private var showingAddView = false
    @ObservedObject private var viewModel = AnnouncementsViewModel()
    //@ObservedObject var announcements = Announcements()
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Announcements")) {
                    ForEach(viewModel.announcements) { announcement in
                        VStack{
                            HStack{
                                Text(announcement.message)
                                  .font(.headline)
                                }
                            }
                        }
                    }
                Section(header: Text("Rules")) {

                    }
                }
            .onAppear() {
                self.viewModel.fetchData()
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showingAddView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

//            .sheet(isPresented: $showingAddView) {
//                AnnounceAddView(announcements: self.announcements)
//            }
        


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

