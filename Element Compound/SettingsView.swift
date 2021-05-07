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
    @State private var presentRoleScreen = false
    @AppStorage ("log_Status") var status = true

    
    
    var body: some View {
        NavigationView{
                List{
                    Section(header: Text("Display Name")){
                        Text("\(Auth.auth().currentUser?.displayName ?? "Not Logged In")")
                    }
                    
                    Section(header: Text("Email")){
                        Text("\(Auth.auth().currentUser?.email ?? "Not Logged In")")
                    }
                    
                    Section(header: Text("Version")){
                        Text("0.1.0")
                    }
                    
                    
                    //Buttons
                    Section{
                        
//                        Button(action: {
//                            //Add functionality here
//                        }) {
//                            Text("Contact The Developer")
//                        }
                        
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
                
                .sheet(isPresented: $presentInfoScreen){
                    InfoScreen()
                }
                
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                        presentInfoScreen = true
                            
                        }) {
                            Image(systemName: "info.circle")
                        }
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
