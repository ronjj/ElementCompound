//
//  ProjectCardView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/29/21.
//

import SwiftUI

struct ProjectCardView2: View {
    @ObservedObject private var viewModel = ProjectsViewModel2()
    var project: Project
    
    
    //project.title
    //project.creator
    //calendaor icon
    //project.pickedDateString2
    //project.color
    //progressbar
    //right arrow
    
    var body: some View {
        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)

            NavigationLink(destination: ProjectDetailsView(project: project )) {
                HStack{
                    //Left Side
    
                    VStack(alignment: .leading) {
                        Text(project.title)
                            .bold()
                            .minimumScaleFactor(1.0)
                        
                        HStack{
                            Text(project.creator)
                                .minimumScaleFactor(1.0)
                            
                            Image(systemName: "calendar.badge.clock")
                                .font(.body)
                                .foregroundColor(Color.ruby)
                                .minimumScaleFactor(1.0)
                            
                            Text("\(project.pickedDateString2)")
                                .minimumScaleFactor(1.0)
                                .font(.system(size: 13.5))
                            
                            Circle()
                                .frame(width: 15, height: 15)
                                .foregroundColor(project.color)
                                .minimumScaleFactor(1.0)
                                //.padding(.horizontal, 7)
                             
                        }
                        //.frame(width: 220)

                        ProgressBar(width: 210, height: 10, percent: project.percentComplete, color1: Color.red, color2: Color.blue)
                    }
                    .padding(.trailing, 5)
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.bginv)
                        .font(.caption)
                        .padding(.horizontal, 8)
                    
                   
                }
            }
        }
        //.frame(width: 360, height: 150)
        .frame(minWidth: 360, maxWidth: 720, minHeight: 150, maxHeight: 300)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
        .padding(5)
    }
}



