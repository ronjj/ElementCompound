//
//  ProjectDetailView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/15/21.
//

import SwiftUI

struct ProjectDetailView: View {
    
    
    // MARK: - State
    
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditProjectSheet = false
    
    // MARK: - State (Initialiser-modifiable)
    
    var project: Project
    
    // MARK: - UI Components
    
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit")
      }
      //.disabled(role == false)
      .disabled(true)
    }
    
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    @AppStorage ("role_Status") var role = Bool()


    var body: some View {
            Form{
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
            .navigationBarTitle(project.title)
            .navigationBarItems(trailing: editButton {
              self.presentEditProjectSheet.toggle()
            })
            .onAppear() {
              print("BookDetailsView.onAppear() for \(self.project.title)")
            }
//            .onDisappear() {
//              print("BookDetailsView.onDisappear()")
//            }
            .sheet(isPresented: self.$presentEditProjectSheet) {
              ProjectEditView2(viewModel: ProjectViewModel2(project: project), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                  self.presentationMode.wrappedValue.dismiss()
                }
              }
            }
    }
}

