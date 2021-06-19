//
//  ProjectDetailView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/15/21.
//

import SwiftUI

struct ProjectDetailView: View {
    
    let project: Project
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    @ObservedObject private var viewModel = ProjectsViewModel2()
    @AppStorage ("role_Status") var role = Bool()
    
    @Environment(\.presentationMode) var presentationMode
    @State private var presentEditProject = false
    
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit")
      }
    }
    
    var body: some View {
        ZStack{
            Color.lightBlue.edgesIgnoringSafeArea(.all)
            
            
            List{
                Section(header: Text("Creation Information")){
                    Text("Created by: \(project.creator)")
                        .font(.body)
                    
                    Text("Created on: \(project.dateString) at \(project.timeString)")
                        .font(.body)
                }
                
               
                
                Section(header: Text("Notes")){
                    
                    LinkedText("\(project.notes)")
//                    Text("Notes: \(project.notes)")
                        .font(.body)
                }
                
                Section(header: Text("Assigned To")){
                    ForEach(project.assignedStudents, id: \.self) { assignedStudent in
                        Label(assignedStudent, systemImage: "person")
                            .accessibilityLabel(Text("Person"))
                            .accessibilityValue(Text(assignedStudent))
                            .font(.body)
                    }
                    
                Section(header: Text("Project Details")){
                    Text("Due: \(project.pickedDateString) at \(project.pickedTimeString)")
                        .font(.body)
                    
                    Text("Priority: \(project.priority)")
                        .font(.body)
                    
                    Text("Progress: \(project.completionLevel)")
                        .font(.body)
                    
                    }
                }
                // ProgressBar(width: 200, height: 40, percent: 60, color1: Color.red, color2: Color.blue)
            }
        }
//        .sheet(isPresented: $presentEditProject) {
//            ProjectEditView(project: project)
//                }
        .sheet(isPresented: self.$presentEditProject) {
          ProjectEditView(viewModel: ProjectViewModel2(project: project), mode: .edit) { result in
            if case .success(let action) = result, action == .delete {
              self.presentationMode.wrappedValue.dismiss()
            }
          }
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
               
                    editButton{
                        self.presentEditProject.toggle()
                      }
                .disabled(role == false)
            }
        }
        .padding(.top, 5)
        .navigationBarTitle("\(project.title)")
    }
}


