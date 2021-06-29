//
//  SettingsViewModel.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/28/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

class SettingsViewModel: ObservableObject {
    
    @Published var newDisplayName = ""
    
    func updateDisplayName() {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = newDisplayName
        changeRequest?.commitChanges { (error) in
            print("error chabging name")
        }
    }
}
