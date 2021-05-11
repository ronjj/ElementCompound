//
//  RoleCodeScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/10/21.
//

import SwiftUI

struct RoleCodeScreen: View {
    
  
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    @AppStorage ("role_Status") var role = Bool()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter Code For Role")) {
                    TextEditor(text: $text)
                        .font(.custom("SF Pro", size: 18))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationTitle("Code For Role")
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
                        Text("Send")
                    }
                }
                
            }
        }
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    
   
    func handleDoneTapped() {
        codeCheck()
        dismiss()
    }
    
    func codeCheck() {
        if text == "password" {
            self.role = true
        } else {
            //need to present an error saying code was wrong
            dismiss()
            self.role = false
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
}

