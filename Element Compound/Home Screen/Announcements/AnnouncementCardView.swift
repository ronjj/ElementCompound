
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
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            HStack{
                //Left side
                VStack(alignment: .leading){
                    Text(announcement.title)
                        .font(Font.custom("Poppins-Black", size: 20))
                        .padding(.bottom, 5)
                    
                    Text(announcement.message)
                        .font(Font.custom("Poppins-Regular", size: 18))
                        .padding(.bottom, 10)
                }
                .padding(.leading)
                
                Spacer()
                
                //Right side
                VStack{
                    Text(announcement.sender)
                        .font(Font.custom("Poppins-Thin", size: 14))
                    
                    ProfileRemoteImage(urlString: "\(announcement.photoURL)")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 90)
                        .clipShape(Circle())
                    
                    Text(announcement.dateString)
                        .font(Font.custom("Poppins-Thin", size: 12))
                    
                    Text(announcement.timeString)
                        .font(Font.custom("Poppins-Thin", size: 10))
                }
                .padding(.trailing)
            }

        }
        .cornerRadius(20)
        .frame(width: 360, height: 200)
        .shadow(color: .veryLightGrey, radius: 5, x: 0, y: 4)
    }
}




