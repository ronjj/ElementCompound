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
     @AppStorage ("login_Status") var loginStatus = Bool()
    @AppStorage ("log_Status") var status = Bool()
    
    
    //MARK: Roles
    func checkUserAuth() {
        let user = Auth.auth().currentUser
        
        //Chao S. Luo
        if user?.email == "sluo@chaminade-hs.org"{
            loginStatus = true
            role = true
        }

        //Ronald Jabouin - Personal Account
        else if user?.email == "ronaldjabouin2004@gmail.com" {
            loginStatus = true
            role = true
        }

        //Ronald Jabouin - School Account
        else if user?.email == "22420rj@chaminade-hs.org" {
            loginStatus = true
            role = true
        }
        
        //Brother Thomas Terrill
        else if user?.email == "tterrill@chaminade-hs.org" {
            loginStatus = true
             role = true
        }
        
        //Thomas Breslin
        else if user?.email == "22102tb@chaminade-hs.org" {
            loginStatus = true
             role = true
        }
        
        //Alexander Dircks
        else if user?.email == "24129ad@chaminade-hs.org" {
            loginStatus = true
             role = true
        }
        
        // Other Members
        else {
            status = false
            role = false
        }
    }
}


