//
//  Users.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/4/21.
//

import SwiftUI
import Firebase
import GoogleSignIn


struct Users{
    // @AppStorage ("role_Status") var role = Bool()
    //
    
    
    let officers = ["Ronald Jabouin", "Thomas Breslin"]
    let advisors = ["Mr. Shuchao Luo", "Bro. Thomas Terrill, S.M"]
}

func UserInfo() {
    let user = Auth.auth().currentUser
    if user?.uid == "FQfZNTWXb2SEfHDuFJwm9iU7LdI2" {
        //role == true
        //else {
        // role == false
        //}
    }
//    if let user = user {
//      // The user's ID, unique to the Firebase project.
//      // Do NOT use this value to authenticate with your backend server,
//      // if you have one. Use getTokenWithCompletion:completion: instead.
//      let uid = user.uid
//      let email = user.email
//      let photoURL = user.photoURL
//      var multiFactorString = "MultiFactor: "
//      for info in user.multiFactor.enrolledFactors {
//        multiFactorString += info.displayName ?? "[DispayName]"
//        multiFactorString += " "
//      }
//      // ...
//    }
}

//class allowedUsers: ObservableObject{
//    let Ronald : UserInfo.user.email = "2"
//}
