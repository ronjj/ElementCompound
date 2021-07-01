//
//  AllAnnouncements.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/13/21.
//


import SwiftUI
import Firebase

struct ProjectsView: View {
    // MARK: - State
    @AppStorage ("role_Status") var role = Bool()
    @StateObject var viewModel = ProjectsViewModel2()
    @State var presentAddProjectSheet = false
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
   
    
    
    // MARK: - UI Components
    
    private var addButton: some View {
      Button(action: { self.presentAddProjectSheet.toggle() }) {
        Image(systemName: "plus")
      }
      .disabled(role == false)
    }
    
    private func projectRowView(project: Project) -> some View {
      NavigationLink(destination: ProjectDetailView(project: project)) {
          HStack{
              VStack(alignment: .leading) {
                  Text(project.title)
                    .font(.headline)
                
                HStack{
                  Text(project.creator)
                    .font(.subheadline)
                  Image(systemName: "calendar.badge.clock")
                    .font(.body)
                    .foregroundColor(Color.ruby)
                    Text("\(project.pickedDateString2)")
                        .font(.subheadline)
                        
        //            Text(project.completionLevel)
        //            .font(.subheadline)
                }
            }
              Spacer()
              
              Circle()
                  .frame(width: 15, height: 15)
              //this color needs to become dynamic
                  .foregroundColor(project.color)
          }
          .padding(20)
      }
    }
    var body: some View {
      NavigationView {
        List{
          ForEach(viewModel.projects) { project in
            projectRowView(project: project)
          }
          .onDelete() { indexSet in
              viewModel.removeProjects(atOffsets: indexSet)

          }
        }
       
        .navigationBarTitle("Projects")
        .navigationBarItems(trailing: addButton)
        .listStyle(PlainListStyle())
        .onAppear() {
          print("BooksListView appears. Subscribing to data updates.")
          self.viewModel.subscribe()
        
      }
//        .onDisappear() {
//          // By unsubscribing from the view model, we prevent updates coming in from
//          // Firestore to be reflected in the UI. Since we do want to receive updates
//          // when the user is on any of the child screens, we keep the subscription active!
//          //
//          // print("BooksListView disappears. Unsubscribing from data updates.")
//          // self.viewModel.unsubscribe()
//        }
        .sheet(isPresented: self.$presentAddProjectSheet) {
            ProjectEditView2()
        }
        
      }
      
    }
  }

//  struct BooksListView_Previews: PreviewProvider {
//    static var previews: some View {
//      BooksListView()
//    }
//  }

    
//    var body: some View {
//        NavigationView{
//                ScrollView(showsIndicators: false){
//                    LazyVStack{
//                        ForEach(viewModel.projects) { project in
//                                NavigationLink(destination: ProjectDetailView(project: project)) {
//                                    ProjectCardView(project: project)
//                                }
//                            }
//                        .padding(7)
//                    }
//                }
//
//            .navigationBarTitle("Projects")
//
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        presentAddNewProject.toggle()
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                    .disabled(role == false)
//                }
//            }
//
//            .sheet(isPresented: $presentAddNewProject){
//               ProjectEditView2()
//            }
//
//            .onAppear{
//                self.viewModel.subscribeNewest()
//            }
//        }
//    }
//}
