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
    var body: some View {
        NavigationView{
           
                
                List{
                    Section(header: Text("Account Info")){
                        Text("Logged in As\n \(Auth.auth().currentUser?.email ?? "Not Logged In")")
                    }
                    
                    Section(header: Text("Sign Out")){
                        Button(action: {
                            logOut()
                           
                        }) {
                            Text("Sign Out Of Account")
                        }
                    }
                }

            }
        .navigationBarTitle("Settings")
                }
    }

    func logOut() {
        
        GIDSignIn.sharedInstance()?.signOut()
        try! Auth.auth().signOut()

    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//ZStack{
//    if Auth.auth().currentUser?.uid != nil {
//
//        TabViewItem()
//
//        }else {
//            LoginView()
//        }
//}


//    if Auth.auth().currentUser?.uid = nil {
//
//            LoginView()
//        }else {
//          TabViewItem()
//
//        }
