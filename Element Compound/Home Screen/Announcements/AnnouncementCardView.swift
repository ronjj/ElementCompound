
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
                    Text(announcement.sender)
                    Spacer()
                    Text(announcement.dateString)
                }
                
                HStack{
                    Spacer()
                    Text(announcement.timeString)
                }
             
                Text(announcement.message)
                    .padding(.top, 10)
                
            }
            .padding(10)
        
    }
}




