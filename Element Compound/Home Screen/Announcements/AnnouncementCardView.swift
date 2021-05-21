
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
    
    
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
       
    var body: some View {
        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)

            
            HStack{
                //Left side
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(colors.randomElement())
                           // .foregroundColor(announcement.color)
                            .frame(width: 10, height: 10)
                    }
                  
                    Text(announcement.title)
                        //.font(Font.custom("Poppins-Regular", size: 18))
                        .bold()
                        .font(.title)
                        .padding(.bottom, 5)
                    
                    Text(announcement.message)
                        .padding(.bottom, 10)
                        .font(.body)
                }
                .padding(.leading)
                
                Spacer()
                
                //Right side
                VStack{
                    Text(announcement.sender)
                        .font(.body)
                     
                    ProfileRemoteImage(urlString: "\(announcement.photoURL)")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 90)
                        .clipShape(Circle())
                    
                    Text(announcement.dateString)
                        .font(.body)
                    
                    Text(announcement.timeString)
                        .font(.body)
                       
                }
                .padding(.trailing)
            }
        }
        .frame(width: 360, height: 200)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
    }
}




