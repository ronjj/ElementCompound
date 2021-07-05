//
//  RejectedScreen.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/2/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct RejectedScreen: View {
    
    @AppStorage ("log_Status") var status2 = Bool()
    
    var body: some View {
        
//        ZStack{
//            if status2 {
//                LoginView()
//            }
//            else{
//               // LoginView()
//                RejectedScreen()
//            }
////            if Auth.auth().currentUser?.uid != nil {
////
////                TabViewItem()
////
////                }else {
////                    LoginView()
////                }
//        }
        VStack{
            Text("The email used to sign in is not associated with an element member. To proceed to the app, please use an email associated with an element member or delete the app ")
            
            Button(action: {
                signOut()
                self.status2 = true
            }) {
                Text("Sign Out")
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
    }
}


