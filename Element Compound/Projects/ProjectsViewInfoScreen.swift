//
//  ProjectsViewInfoScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 9/1/21.
//

import SwiftUI

struct ProjectsViewInfoScreen: View {
    
    @ObservedObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    Link("Google Sheets File",
                          destination: URL(string: "https://docs.google.com/spreadsheets/d/1YiBMGX-fBW1lBv2TWrh-X78ctk-IczH9rUM4Anv38_M/edit?usp=sharing")!)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Project Spreadhseet")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        handleCancelTapped()
                    }) {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    func handleDoneTapped() {
        viewModel.handleDoneTapped()
        dismiss()
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
