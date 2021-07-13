//
//  InfoScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/2/21.
//

import SwiftUI

struct InfoScreen: View {
    
    @ObservedObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Important Links")) {
                    Link("Chaminade Website",
                          destination: URL(string: "https://www.chaminade-hs.org")!)

                    Link("Element Website",
                          destination: URL(string: "https://www.element.chaminade-hs.org")!)
                    
                    Link("Club Rules",
                          destination: URL(string: "https://www.element.chaminade-hs.org")!)
                        .disabled(true)
                    
                    Link("Changelog",
                          destination: URL(string: "https://www.element.chaminade-hs.org")!)
                        .disabled(true)
                }
                
                Section(header: Text("Credit")) {
                        Text("Brother Thomas Terrill - Beta Tester")
                        Text("Chao S. Luo - Advisor and Designer")
                        Text("Jack Muscatello - Product Descriptions")
                        Text("Ronald Jabouin - Lead Developer")
                        Text("Luke DeBono - Product Photographer")
                        Text("Thomas Breslin - Course Coordinator")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Club Information")
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

