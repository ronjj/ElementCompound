//
//  ProjectDetailView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/15/21.
//

import SwiftUI

struct ProjectDetailView: View {
    
    let project: Project
    @ObservedObject private var viewModel = ProjectsViewModel()
    
    var body: some View {
        Text(project.title)
    }
}

