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
    @ObservedObject private var viewModel = ProjectsViewModel()
    
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
                
                Section(header: Text("Project Details")){
                    Text("Due: \(project.pickedDateString) at \(project.pickedTimeString)")
                        .font(.body)
                    
                    Text("Priority: \(project.priority)")
                        .font(.body)
                    
                    Text("Progress: \(project.completionLevel)")
                        .font(.body)
                }
                
                Section(header: Text("Notes")){
                    Text("Notes: \(project.notes)")
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
            }
        }
        .padding(.top, 5)
        .navigationBarTitle("\(project.title)")
    }
}


