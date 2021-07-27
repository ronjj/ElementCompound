//
//  CoursesView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.

 
import SwiftUI
 
struct CoursesView: View {
     
    @State var backgroundOffset: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { g in
            HStack(spacing: 0) {
                CameraCourseView()
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: g.size.width, height: g.size.height)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: g.size.width, height: g.size.height)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            }
            .offset(x: -(self.backgroundOffset * g.size.width))
            .animation(.default)
            
            ZStack{
                Rectangle()
                    .fill(Color.white.opacity(3.0))
                    .frame(width: 85, height: 25)
                    .cornerRadius(10)
                
                HStack{
                    Circle()
                        .fill(Color.green)
                        .frame(width: self.backgroundOffset == 0 ? 30 : 20, height: self.backgroundOffset == 0 ? 30 : 20)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                        )
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: self.backgroundOffset == 1 ? 30 : 20, height: self.backgroundOffset == 1 ? 30 : 20)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                        )
                    
                    Circle()
                        .fill(Color.blue )
                        .frame(width: self.backgroundOffset == 2 ? 30 : 20, height: self.backgroundOffset == 2 ? 30 : 20)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                        )
                }
                .animation(.default)
            }
           .position(x:g.size.width/2, y:g.size.height/9)
        }
        .edgesIgnoringSafeArea(.all)

        .gesture(
        DragGesture()
            .onEnded({ value in
                if value.translation.width > 10 {
                    
                    if self.backgroundOffset > 0 {
                        self.backgroundOffset -= 1
                    }
                } else if value.translation.width < -10 {
                    
                    if self.backgroundOffset < 2 {
                        self.backgroundOffset += 1
                    }
                   
                }
            })
        )
    }
}
