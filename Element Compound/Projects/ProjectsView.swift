//
//  AllAnnouncements.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/13/21.
//


import SwiftUI
import Firebase

struct ProjectsView: View {
    @ObservedObject var viewModel = ProjectsViewModel()
    
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
           
            .navigationBarTitle("Projects")
            
            .sheet(isPresented: $presentAddNewProject){
               ProjectAddView()
            }

            .onAppear(){
                self.viewModel.fetchData()
    
            }
        }
    }
}



