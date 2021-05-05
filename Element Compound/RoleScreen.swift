//
//  RoleScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/4/21.
//

import SwiftUI

struct RoleScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var code = ""
    @StateObject var viewModel = AnnoucnementViewModel()
    @AppStorage ("role_Status") var role = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter the Code for Role")) {
                    TextField("Code", text: $code)
                        .font(.custom("SF Pro", size: 18))
                        .foregroundColor(.gray)
                }   
            }
            .navigationTitle("Officers / Advisors")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        handleCancelTapped()
                    }) {
                        Text("Cancel")
                    }
                    
                    Button(action: {
                        handleDoneTapped()
                        //also needs to check to see if the code is correct
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
        viewModel.save()
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
