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
    
    @AppStorage ("role_Status") var role = Bool()
    
    @ObservedObject var viewModel = AnnouncementsViewModel()
    //@ObservedObject var projectViewModel = ProjectViewModel2()
    @ObservedObject var userAuth = Users()
    @State private var activeSheet: Sheets2?
   // @ObservedObject var favorites = Favorites()
   
    @State private var presentAddNewAnnouncement = false
    @State private var presentInfoScreen = false
    @State private var buttonDisabled = true
   // let projects = self.projects
    
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
            //            CustomTabBar()
            //                .navigationTitle("")
            //                .navigationBarTitleDisplayMode(.inline)
            //                .navigationBarHidden(true)
            //
            ZStack{
                Color.lightBlue.edgesIgnoringSafeArea(.all)
                
                Image("elementicontrans2")
                    .font(.title)
                
                ScrollView{
                    HStack{
                        Text("Announcements")
                            .padding()
                            .font(Font.custom("Poppins-Regular", size: 18))

                        Button(action: { activeSheet = .addAnnoun },
                               label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                              Image(systemName: "plus")
                                    .foregroundColor(.accentColor)
                            }
                        })
                            .disabled(role == false)
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
                            AnnouncementCardView(announcement: announcement)
                        }
                        .padding(7)
                        
                        NavigationLink(destination: AllAnouncements(), tag: 1, selection: $action) {
                            EmptyView()
                        }
                    }
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
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        activeSheet = .info
                    }) {
                        Image(systemName: "info.circle")
                    }
                    
                }
            }
            
            .navigationBarTitle("Element Compound")
//            .sheet(isPresented: $presentInfoScreen){
//                InfoScreen()
//            }
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
            }
        }
    }

