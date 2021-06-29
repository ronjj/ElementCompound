//
//  DisplayNameChangeScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/28/21.
//

import SwiftUI
import Combine


struct DisplayNameChangeScreen: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()
//    @ObservedObject var textBindingManager = TextBindingManager(limit: 15)
    @ObservedObject var textBindingManager = TextBindingManager()
    @Environment(\.presentationMode) var presentationMode
    let textLimit = 15

    
        
        var body: some View {
            NavigationView{
                Form{
                    Section(header: Text("Enter New Display Name")) {
                        TextField("Enter Display Name Here", text:$settingsViewModel.newDisplayName)
                            .font(.custom("SF Pro", size: 18))
                            .onReceive(Just(settingsViewModel.newDisplayName)) { _ in limitText(textLimit) }
                    }
                    
                    Section(header: Text("Disclaimer")) {
                        Text("Change will take place in the settings once you quit and reopen the app")
                          
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
    
    func limitText(_ upper: Int) {
            if settingsViewModel.newDisplayName.count > upper {
                settingsViewModel.newDisplayName = String(settingsViewModel.newDisplayName.prefix(upper))
            }
        }
        
    }
