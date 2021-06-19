//
//  AllAnnouncements.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/13/21.
//


import SwiftUI
import Firebase

struct ProjectsView: View {
    @ObservedObject var viewModel = ProjectsViewModel2()
    
    @AppStorage ("role_Status") var role = Bool()
    
    @State private var action: Int? = 0
    @State private var presentAddNewProject = false
    @State private var presentInfoScreen = false
    @State private var buttonDisabled = true
  
    var body: some View {
        NavigationView{
            ZStack{
                Color.lightBlue.edgesIgnoringSafeArea(.all)

                ScrollView(showsIndicators: false){
                    LazyVStack{
                        ForEach(viewModel.projects) { project in
                            NavigationLink(destination: ProjectDetailView(project: project)) {
                                ProjectCardView(project: project)
                            }
                          
                        }
                        .padding(7)
                    }
                }
            }
            .navigationBarTitle("Projects")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentAddNewProject.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .disabled(role == false)
                }
            }
           
           
            
            .sheet(isPresented: $presentAddNewProject){
               ProjectEditView()
            }

            .onAppear(){
              //  self.viewModel.fetchData()
                self.viewModel.subscribe()
    
            }
        }
    }
}



