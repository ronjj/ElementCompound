//
//  HomeView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct HomeView2: View {
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @State private var presentAddNewAnnouncement = false
    @State private var presentInfoScreen = false
    @AppStorage ("role_Status") var role = false
    @State private var buttonDisabled = true
    
    

    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Announcements")){
                    ForEach(viewModel.announcements) { announcement in
                        AnnouncementCardView(announcement: announcement)
                    }
                }
//                Section(header: Text("My Projects")) {
//                    Can uncomment this section once I finish the projects part of the app
//                }
               
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

//struct HomeView2_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView2()
//    }
//}

