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
        
        // Other Members
        else {
            role = false
        }
    }
}
