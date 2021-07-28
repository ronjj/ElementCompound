//
//  ProjectsView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/28/21.
//

import SwiftUI


enum ProjectSheets: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    case addProj
   
}
struct ProjectsListView2: View {
    // MARK: - State
    @AppStorage ("role_Status") var role = Bool()
    @StateObject var viewModel = ProjectsViewModel2()
    @ObservedObject var viewModel2 = ProjectViewModel2()
    @State var presentAddProjectSheet = false
    @State private var activeSheet: ProjectSheets?
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    
    
    // MARK: - UI Components
    private var addButton: some View {
        Button(action: { self.presentAddProjectSheet.toggle() }) {
            Image(systemName: "plus")
        }
        .disabled(role == false)
        .opacity(role == false ? 0.0 : 1.0)
    }
    
    private func projectRowView(project: Project) -> some View {
        NavigationLink(destination: ProjectDetailsView(project: project )) {
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
                        
                    }
                    ProgressBar(width: 220, height: 10, percent: project.percentComplete, color1: Color.red, color2: Color.blue)
                    // viewModel2.project.percentComplete,
                }
                .lineLimit(nil)
                
                Spacer()
                
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(project.color)
            }
            //.frame(widith: 300, height: 200)
            .background(Color.white)
            .padding(20)
        }
    }
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.lightBlue.edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    HStack {
                        Text("Projects")
                            .font(.largeTitle)
                            .foregroundColor(.bginv)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            activeSheet = .addProj
                        }) {
                             ZStack {
                                Circle()
                                    .foregroundColor(.bg)
                                    .frame(width: 25, height: 25)
                              Image(systemName: "plus")
                                    .foregroundColor(.bginv)
                            }
                        }
                        
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    
                    LazyVStack {
                        ForEach (viewModel.projects) { project in
                            ProjectCardView(project: project)
                        }
                        .onDelete() { indexSet in
                            viewModel.removeProjects(atOffsets: indexSet)
                        }
                        //Disbales swipe to delete if user does not have role
                        .deleteDisabled(role ? false : true)
                    }
                }
              
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
                .navigationBarTitle("Projects")
                .navigationBarItems(trailing: addButton)
                .onAppear() {
                    print("BooksListView appears. Subscribing to data updates.")
                    self.viewModel.subscribe()
                }
                .onDisappear() {
                    // By unsubscribing from the view model, we prevent updates coming in from
                    // Firestore to be reflected in the UI. Since we do want to receive updates
                    // when the user is on any of the child screens, we keep the subscription active!
                    
                    print("ProjectsView disappears. Unsubscribing from data updates.")
                    self.viewModel.unsubscribe()
                }
//                .sheet(isPresented: self.$presentAddProjectSheet) {
//                    ProjectEditView2()
//                }
                .sheet(item: $activeSheet) { item in
                    switch item {
                    case .addProj:
                        ProjectEditView2()
                    }
                }
                
                if viewModel.projects.isEmpty{
                    withAnimation(.default) {
                        EmptyState(imageName: "warningSign", message: "No projects at the moment. Stop by the office to see what you can work on.")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell.EditingStyle {
        if role == true{
            return UITableViewCell.EditingStyle.delete
        }
        return UITableViewCell.EditingStyle.none
    }
}
