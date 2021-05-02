//
//  HomeView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI

struct HomeView2: View {
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @State private var presentAddNewAnnouncement = false
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.announcements) { announcement in
                    AnnouncementCardView(announcement: announcement)
                }
            }
            .navigationBarTitle("Home")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        presentAddNewAnnouncement.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $presentAddNewAnnouncement){
                AnnouncementEditView()
            }
            .onAppear(){
                self.viewModel.fetchData()
            }
        }
    }
}

struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}
