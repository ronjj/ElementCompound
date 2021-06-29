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
                       // TextField("Eneter New Display name", text: $textBindingManager.text)
                        TextEditor(text:$settingsViewModel.newDisplayName)
                            .font(.custom("SF Pro", size: 18))
                            .frame(height: 50, alignment: .center)
                            .multilineTextAlignment(.leading)
                            .onReceive(Just(settingsViewModel.newDisplayName)) { _ in limitText(textLimit) }
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
