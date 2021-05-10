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
    
    @AppStorage ("role_Status") var role = false
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @State private var presentAddNewAnnouncement = false
    @State private var presentInfoScreen = false
    @State private var buttonDisabled = true
  
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Announcements")){
                    ForEach(viewModel.announcements) { announcement in
                        AnnouncementCardView(announcement: announcement)
                    }
                }
                
                .padding(EdgeInsets(top: 22, leading: 5, bottom: 24, trailing: 5))

                //                Section(header: Text("My Projects")) {
                //                    Can uncomment this section once I finish the projects part of the app
                //                }
               
            }
            .navigationBarTitle("Element Compound")
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
        .background(Color.green)
    }
//    mutating func getRole()  {
//      if Auth.auth().currentUser?.email == "22420rj@chaminade-hs.org" {
//          announcement.role = "Officer"
//      } else if Auth.auth().currentUser?.email == "22102tb@chaminade-hs.org" {
//          announcement.role = "Officer"
//      } else if Auth.auth().currentUser?.email == "sluo@chaminade-hs.org" {
//          announcement.role = "Advisor"
//      } else if Auth.auth().currentUser?.email == "tterill@chaminade-hs.org" {
//          announcement.role = "Advisor"
//      } else {
//          announcement.role = "Member"
//      }
//  }
}




struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}



