
//  AnnouncementCardView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.


import SwiftUI
import Firebase
import GoogleSignIn

struct AnnouncementCardView: View {
    @ObservedObject private var viewModel = AnnouncementsViewModel()
    var announcement: Announcement
    
    var body: some View {
        VStack{
            HStack{
                Text("Mr. Luo")
                Spacer()
                Text("1/5/21")
            }
            
            HStack{
            //    Text("Advisor")
                Spacer()
                Text("12:30pm")
            }
         
            Text(announcement.message)
                .padding(.top, 10)
            
        }
        .padding()
    }
}


