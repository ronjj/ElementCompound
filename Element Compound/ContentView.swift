//
//  ContentView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/21/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @AppStorage ("log_Status") var status = Bool()
    
    var body: some View {
        ZStack{
            if status {
                TabViewItem()
            }
            else {
                LoginView()
                
            }
        }
    }
}

