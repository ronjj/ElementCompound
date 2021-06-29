//
//  Users.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/4/21.
//

import SwiftUI
import Firebase
import GoogleSignIn


class Users: ObservableObject{
     @AppStorage ("role_Status") var role = Bool()
    
    
    
    let officers = ["Ronald Jabouin", "Thomas Breslin"]
    let advisors = ["Mr. Shuchao Luo", "Bro. Thomas Terrill, S.M"]
    
    func checkUserAuth() {
        let user = Auth.auth().currentUser
        //sluo@chaminade-hs.org
        if user?.uid == "FQfZNTWXb2SEfHDuFJwm9iU7LdI2" {
            role = true
        }
        
        //ronaldjabouin2004@gmail.com
        else if user?.uid == "PhDjOmlUUQgdmxwXvfepOn4JLUx2" {
             role = true
        }
        
        //22420rj@chaminade-hs.org
        else if user?.uid == "wiK3A60HKmbdK9Lw8DHMiW2Qk9t1" {
             role = true
        }
        
        //tterrill@chaminade-hs.org
        else if user?.uid == "JbEGdMXQjihko4H3XOK7yBVxzjm2" {
             role = true
        }
        
        //22102tb@chaminade-hs.org
        else if user?.uid == "r5p3zBbSOPPEC50Od0En707SPBf2" {
             role = true
        }
        
        //24129ad@chaminade-hs.org
        else if user?.uid == "8BIdVf0AbsbFkt6JTTWObkCawD72" {
             role = true
        }
        
        
        else{
                role = false
        }
    }
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


//class allowedUsers: ObservableObject{
//    let Ronald : UserInfo.user.email = "2"
//}
