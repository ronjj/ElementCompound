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

                ScrollView(showsIndicators: false){
                    LazyVStack{
                        ForEach(viewModel.announcements) { announcement in
                            AnnouncementCardView(announcement: announcement)
                        }
                        .padding(7)
                    }
                }
            }
            .navigationBarTitle("All Announcements")
           
          
            .onAppear(){
                self.viewModel.fetchData()
    
        }
    }
}


//struct AllAnouncements_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView2()
//    }
//}



