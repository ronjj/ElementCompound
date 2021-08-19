//
//  HomeView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import Firebase
import GoogleSignIn


enum Sheets2: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    case info
    case addAnnoun
}



struct HomeView2: View {
    //@ObservedObject var projectViewModel = ProjectViewModel2()
    // let projects = self.projects
    // @ObservedObject var favorites = Favorites()
 //    @State private var presentAddNewAnnouncement = false
 //    @State private var presentInfoScreen = false
    @AppStorage ("role_Status") var role = Bool()
    
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @ObservedObject var userAuth = UsersViewModel()
    
    @State private var activeSheet: Sheets2?
    @State private var buttonDisabled = true
    @State private var action: Int? = 0
    
    
    
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
                
                Image("elementicontrans2")
                    .font(.title)
                
                if viewModel.announcements.isEmpty{
                    withAnimation(.default) {
                        EmptyStateBlue(imageName: "warningSign", message: "No announcements at the moment. ")
                    }
                    .padding(.top, 75)
                }
                   
                
                ScrollView{
                    HStack {
                        Text("Element Compound")
                            .font(.largeTitle)
                            .foregroundColor(.bginv)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            activeSheet = .info
                        }) {
                            Image(systemName: "info.circle")
                                .font(.title2)
                        }
                        
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    
                    HStack{
                        Text("Announcements")
                            .padding()
                            .font(Font.custom("Poppins-Regular", size: 18))

                        Button(action: { activeSheet = .addAnnoun },
                               label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(.bg)
                                    .frame(width: 25, height: 25)
                              Image(systemName: "plus")
                                    .foregroundColor(.bginv)
                            }
                        })
                            .disabled(role == false)
                            .opacity(role ? 1.0 : 0.0)
                            .padding(.leading, -15)
                        
                        Spacer()
                        Button{
                            self.action = 1
                        } label: {
                            ButtonStyle(title: "View All")
                        }
                        .padding()
                        .shadow(color: .bg, radius: 15, x: 0, y: 7.5)
                        
                    }
                    .padding(.bottom, -10)
                    
                    LazyVStack{
                        ForEach(viewModel.announcements.prefix(2)) { announcement in
                            NavigationLink(destination: AnnouncementDetailView( announcement: announcement)) {
                                AnnouncementCardView(announcement: announcement)
                            }
                        }
                        .padding(7)
                        
                        NavigationLink(destination: AllAnouncements(), tag: 1, selection: $action) {
                            EmptyView()
                        }
                    }
                    .padding(.bottom, 130)
                    .padding(10)
                    
                  
                    
//                    HStack{
//                        Text("My Projects")
//                            .padding()
//                            .font(Font.custom("Poppins-Regular", size: 18))
//
//                        Spacer()
//                    }
//                    .padding(.bottom, -10)

//                                        LazyVStack{
//                                                    ForEach(favorites, id: \.self) { project in
//                                                            NavigationLink(destination: ProjectDetailView(project: project)) {
//                                                                ProjectCardView(project: project)
//                                                            }
//                                                        }
//                                                    .padding(7)
//
//                                            }
                    }
               
                }
            
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        activeSheet = .info
//                    }) {
//                        Image(systemName: "info.circle")
//                    }
//
//                }
//            }
            
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .sheet(item: $activeSheet) { item in
                switch item {
                case .info:
                    InfoScreen()
                case .addAnnoun:
                    AnnouncementAddView()
                }
            }
            .onAppear(){
                self.viewModel.subscribe()
                self.userAuth.checkUserAuth()
                
                }
          
            //Causes the screen to shift down then up when reappearing in ios 14. Can add back in ios 15
//            .onDisappear() {
//              // By unsubscribing from the view model, we prevent updates coming in from
//              // Firestore to be reflected in the UI. Since we do want to receive updates
//              // when the user is on any of the child screens, we keep the subscription active!
//
//               print("HomeView disappears. Unsubscribing from data updates.")
//               self.viewModel.unsubscribe()
//            }
            }
        .navigationViewStyle(StackNavigationViewStyle())
        
        }
    }

