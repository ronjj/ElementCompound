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
    
    @AppStorage ("role_Status") var role = Bool()
    
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @State private var presentAddNewAnnouncement = false
    @State private var presentInfoScreen = false
    @State private var buttonDisabled = true
  
    
    var body: some View {
        NavigationView{
//            List{
//                Section(header: Text("Announcements")){
//                    ForEach(viewModel.announcements) { announcement in
//                        AnnouncementCardView(announcement: announcement)
//                    }
//                }
//                .padding(EdgeInsets(top: 22, leading: 5, bottom: 24, trailing: 5))

//                Section(header: Text("My Projects")) {
//                    Can uncomment this section once I finish the projects part of the app
//                }
            ZStack{
                Color.lightBlue.edgesIgnoringSafeArea(.all)
                
                
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.announcements) { announcement in
                            AnnouncementCardView(announcement: announcement)
                        }
                        .padding(10)
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentAddNewAnnouncement.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .disabled(role == false)
                }
            }
           
            .navigationBarTitle("Element Compound")
            
            .sheet(isPresented: $presentAddNewAnnouncement){
                AnnouncementEditView()
            }

            .onAppear(){
                self.viewModel.fetchData()
    
            }
        }
        
    }
    
    // need to call this function in onAppear
    
    //test if it actually works and the other method is not affecting this system
//    func getRole()  {
//      if Auth.auth().currentUser?.email == "22420rj@chaminade-hs.org" {
//          self.role = true
//      } else if Auth.auth().currentUser?.email == "22102tb@chaminade-hs.org" {
//          self.role = true
//      } else if Auth.auth().currentUser?.email == "sluo@chaminade-hs.org" {
//           self.role = true
//      } else if Auth.auth().currentUser?.email == "tterill@chaminade-hs.org" {
//          self.role = true
//      } else {
//          self.role = true
//      }
    
//  }
}




struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}



