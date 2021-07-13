
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

            
            HStack{
                //Left side
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Rectangle()
                            .cornerRadius(10)
                            //.foregroundColor(colors.randomElement())
                            .foregroundColor(project.color)
                            .frame(width: 10, height: 10)
                    }
                  
                    Text(project.title)
                        //.font(Font.custom("Poppins-Regular", size: 18))
                        .bold()
                        .font(.title)
                        .padding(.bottom, 5)
                    
                    Text("\(project.pickedDateString)")
                        .font(.title3)
                        .padding(.bottom, 5)
                        .minimumScaleFactor(1.0)
                    
                }
                .padding(.leading)
                
                Spacer()
                
                //Right side
                VStack{
//                    Text(project.creator)
//                        .font(.body)
                    
//                    Text(project.extraInfo)
//                        .font(.body)

//                    Text(project.dateString)
//                        .font(.body)
//
//                    Text(project.timeString)
//                        .font(.body)
                    
//                    Text(project.completionLevel)
//                        .font(.body)
                    
                   
                }
                .padding(.trailing)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.bginv)
                    .font(.caption)
                    .padding(.horizontal, 8)
            }
        }
        .frame(width: 360, height: 200)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
    }
}




