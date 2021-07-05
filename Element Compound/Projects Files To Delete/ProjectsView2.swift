////
////  ProjectsView2.swift
////  Element Compound
////
////  Created by Ronald Jabouin on 6/25/21.
////
//
//import SwiftUI
//
//@available(iOS 14.0, *)
//struct ProjectsListView: View {
//  // MARK: - State
//  
//  @StateObject var viewModel = ProjectsViewModel2()
//  @State var presentAddProjectSheet = false
//  
//  // MARK: - UI Components
//  
//  private var addButton: some View {
//    Button(action: { self.presentAddProjectSheet.toggle() }) {
//      Image(systemName: "plus")
//    }
//  }
//  
//  private func projectRowView(project: Project) -> some View {
//    NavigationLink(destination: ProjectDetailView(project: project)) {
//      VStack(alignment: .leading) {
//        Text(project.title)
//          .font(.headline)
//        Text(project.creator)
//          .font(.subheadline)
//          Text(project.completionLevel)
//          .font(.subheadline)
//      }
//    }
//  }
//  
//  var body: some View {
//    NavigationView {
//      List {
//        ForEach (viewModel.projects) { project in
//         projectRowView(project: project)
//        }
//        .onDelete() { indexSet in
//          viewModel.removeProject(atOffsets: indexSet)
//        }
//      }
//      .navigationBarTitle("Projects")
//      .navigationBarItems(trailing: addButton)
//      .onAppear() {
//        print("ProjectListView appears. Subscribing to data updates.")
//        self.viewModel.subscribe()
//      }
//      .onDisappear() {
//        // By unsubscribing from the view model, we prevent updates coming in from
//        // Firestore to be reflected in the UI. Since we do want to receive updates
//        // when the user is on any of the child screens, we keep the subscription active!
//        //
//        // print("BooksListView disappears. Unsubscribing from data updates.")
//        // self.viewModel.unsubscribe()
//      }
//      .sheet(isPresented: self.$presentAddProjectSheet) {
//        ProjectEditView2()
//      }
//    }
//  }
//}
//
////struct BooksListView_Previews: PreviewProvider {
////  static var previews: some View {
////    BooksListView()
////  }
////}
