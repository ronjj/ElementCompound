//
//  SettingsView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct SettingsView: View {
    
    @State private var presentInfoScreen = false
    @AppStorage ("log_Status") var status = true
    
    
    var body: some View {
        NavigationView{
                List{
                    Section(header: Text("Account Info")){
                        Text("Logged in As: \(Auth.auth().currentUser?.email ?? "Not Logged In")")
                    }
                    
                    Section(header: Text("App Info")){
                        Text("Version: 0.0.0")
                    }
                    
                    //Buttons
                    Section{
                        
                        Button(action: {
                            //
                        }) {
                            Text("Contact The Developer")
                        }
                        
                        Button(action: {
                            signOut()
                            self.status = false
                        }) {
                            Text("Sign Out")
                        }
                    }
                    
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Settings")
            }
       
        .toolbar {
            
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button(action: {
                presentInfoScreen.toggle()
                    
                }) {
                    Image(systemName: "info.circle")
                }
            }
        }
        }
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
    }


//    func logOut() {
//
//        GIDSignIn.sharedInstance()?.signOut()
//        try! Auth.auth().signOut()
//
//    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

    }
