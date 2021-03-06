
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
                        Circle()
                            .frame(width: 10, height: 10)
                            //.foregroundColor(announcement.color)
                            .foregroundColor(colors.randomElement())
                    }
                    
                    Text(announcement.title)
                    //.font(Font.custom("Poppins-Regular", size: 18))
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 5)
                        .minimumScaleFactor(0.4)
                    
                    LinkedText(announcement.message)
                    //Text(announcement.message)
                        .padding(.bottom, 10)
                        .font(.body)
                        .minimumScaleFactor(0.4)
                }
                .multilineTextAlignment(.leading)
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
                    //                    AsyncImage(url: announcement.photoURL)
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: 120, height: 90)
                    //                        .clipShape(Circle())
                    
                    Text(announcement.dateString)
                        .font(.body)
                    
                    Text(announcement.timeString)
                        .font(.body)
                    
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.bginv)
                    .font(.caption)
                    .padding(.horizontal, 4)
                    
                .padding(.trailing, 4)
            }
        }
        //.frame(width: 360, height: 200)
        .frame(minWidth: 360, maxWidth: 720, minHeight: 200, maxHeight: 400)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
        .padding(5)
    }
}




