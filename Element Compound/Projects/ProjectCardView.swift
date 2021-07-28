
//  AnnouncementCardView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.


import SwiftUI
import Firebase
import GoogleSignIn


//need to change announcement stuff
struct ProjectCardView: View {
    @ObservedObject private var viewModel = ProjectsViewModel2()
    var project: Project
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
       
    var body: some View {
        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)

            NavigationLink(destination: ProjectDetailsView(project: project )) {
                HStack{
                    VStack(alignment: .leading) {
                        Text(project.title)
                            .font(.headline)
                        HStack{
                            Text(project.creator)
                                .font(.subheadline)
                            
                            Image(systemName: "calendar.badge.clock")
                                .font(.body)
                                .foregroundColor(Color.ruby)
                            
                            Text("\(project.pickedDateString2)")
                                .font(.subheadline)
                            
                        }
                        ProgressBar(width: 220, height: 10, percent: project.percentComplete, color1: Color.red, color2: Color.blue)
                        
                    }
                    .padding(.leading, 10)
                    .lineLimit(nil)
                    
                    Spacer()
                    
                    HStack{
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(project.color)

                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.bginv)
                            .font(.caption)
                            .padding(.horizontal, 8)
                    }
                }
            }
        }
        .frame(width: 360, height: 150)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
        .padding(5)
    }
}




