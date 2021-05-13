//
//  AllAnnouncements.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/13/21.
//


import SwiftUI
import Firebase

struct AllAnouncements: View {
    
  
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @State private var action: Int? = 0
  
    
    var body: some View {
            ZStack{
                Color.lightBlue.edgesIgnoringSafeArea(.all)

                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.announcements) { announcement in
                            AnnouncementCardView(announcement: announcement)
                        }
                    }
                    .navigationBarTitle("All Announcements")
                    .padding(10)
                }
                .edgesIgnoringSafeArea(.all)
                .padding()
                
            }
            .onAppear(){
                self.viewModel.fetchData()
    
            }
    }
}


struct AllAnouncements_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}



