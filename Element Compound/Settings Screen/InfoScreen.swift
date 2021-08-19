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
                    
                    Link("Club Roles, Rules, and Credit",
                          destination: URL(string: "https://www.element.chaminade-hs.org/club-roles")!)
                    
                    Link("App Information and Changelog",
                          destination: URL(string: "https://www.element.chaminade-hs.org/app")!)
                        
                }
                
                Section(header: Text("The Team")) {
                    Text("Ronald Jabouin - Developer")
                        .font(.caption)
                    
                    Text("Brother Tom Terrill - Beta Tester")
                        .font(.caption)
                    
                    Text("Mr. Luo - UI Designer, Photographer, Graphic Designer")
                        .font(.caption)
                    
                    Text("Luke DeBono - Photographer and Additional Illustrator")
                        .font(.caption)
                
                    Text("Jack Muscatello - Content Writer")
                        .font(.caption)
                    
                    Text("Thomas Breslin - Content Writer")
                        .font(.caption)
                    
                    Text("Gaby DeBono  - Additional Illustrator")
                        .font(.caption)
                }
                
//                Section(header: Text("Credit")) {
//                        Text("Brother Thomas Terrill - Beta Tester")
//                        Text("Chao S. Luo - Advisor and Designer")
//                        Text("Jack Muscatello - Product Descriptions")
//                        Text("Ronald Jabouin - Lead Developer")
//                        Text("Luke DeBono - Product Photographer")
//                        Text("Thomas Breslin - Course Coordinator")
//                }
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

