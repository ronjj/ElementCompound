//
//  InfoScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/2/21.
//

import SwiftUI

struct InfoScreen: View {
    
    @StateObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Club Rules")) {
                    Text("club rules")
                }
                
                Section(header: Text("Important Links")) {
                    Text("Link 1")
                    Text("Link 2")
                }
            }
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
        viewModel.save()
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementEditView()
    }
}
