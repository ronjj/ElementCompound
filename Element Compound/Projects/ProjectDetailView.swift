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
                Section{
                    Text("Created by: \(project.creator)")
                        .font(.body)
                    
                    Text("Created on: \(project.dateString) at \(project.timeString)")
                        .font(.body)
                }
                
                Section{
                    Text("Due: \(project.pickedDateString) at \(project.pickedTimeString)")
                        .font(.title3)
                        .padding(.bottom, 5)
                    
                    Text("Progress: \(project.completionLevel)")
                        .font(.title3)
                        .padding(.bottom, 5)
                }
            }
            .padding(.top, 5)
        }
        .navigationBarTitle("\(project.title)")
    }
}

