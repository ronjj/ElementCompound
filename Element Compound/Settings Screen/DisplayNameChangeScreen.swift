//
//  DisplayNameChangeScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/28/21.
//

import SwiftUI


struct DisplayNameChangeScreen: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()
    @Environment(\.presentationMode) var presentationMode

    
        
        var body: some View {
            NavigationView{
                Form{
                    Section(header: Text("Enter New Display Name")) {
                        TextEditor(text:$settingsViewModel.newDisplayName)
                            .font(.custom("SF Pro", size: 18))
                            .frame(height: 50, alignment: .center)
                            .multilineTextAlignment(.leading)
                    }
                    
                }
                .navigationTitle("New Display Name")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        Button(action: {
                            handleCancelTapped()
                        }) {
                            Text("Cancel")
                        }
                        
                        Button(action: {
                            handleDoneTapped()
                        }) {
                            Text("Confirm")
                        }
                        
                    }
                    
                }
            }
        }
        
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    func handleDoneTapped() {
        settingsViewModel.updateDisplayName()
        dismiss()
    }
        
    }
