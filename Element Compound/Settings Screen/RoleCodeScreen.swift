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
    @State var correctPassword = false
    @State var incorrectPassword = false
    @AppStorage ("role_Status") var role = Bool()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter Code For Role")) {
                    SecureField("Code", text: $text)
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
                     handleEnterTapped()
                    }) {
                        Text("Enter")
                    }
                }
            }

            .alert(isPresented: self.$correctPassword) {
                Alert(title: Text("Correct Password"), message: Text("You Now Have Extra Capabilities"), dismissButton: .cancel())
            }
            .alert(isPresented: self.$incorrectPassword) {
                Alert(title: Text("Incorrect Password"), message: Text("Incorrect Password. Current status remains."), dismissButton: .cancel())
            }
        }
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    
   
    func handleEnterTapped() {
        dismiss()
        codeCheck()
      
    }
    
    func codeCheck() {
        if text == "Password" {
            self.role = true
            self.correctPassword.toggle()
        } else {
            //need to present an error saying code was wrong
            self.incorrectPassword.toggle()
            self.role = false
            text = ""
            
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
}

