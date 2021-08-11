//
//  CoursesView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.

 
import SwiftUI
 
struct CoursesView: View {
     
    @State var backgroundOffset: CGFloat = 0
    @State var isShowingEditDetail = false
    @State var isShowingCameraDetail = false
    @State var isShowingAudioDetail = false
    
    
   
    var body: some View {
        
        GeometryReader { g in
            HStack(spacing: 0) {
                CameraCourseView(isShowingCameraDetail: $isShowingCameraDetail, backgroundOffset: $backgroundOffset)
               // EditingCourseView(isShowingEditDetail:  $isShowingEditDetail)
               // AudioCourseView(isShowingAudioDetail: $isShowingAudioDetail)
                iFrameCourseView()
            }
            .offset(x: -(self.backgroundOffset * g.size.width))
            .animation(.easeIn)
            
            ZStack{
                Rectangle()
                    .fill(Color.white.opacity(3.0))
                /*all four
                    .frame(width: 115, height: 25)
                 */
                    .frame(width: 50, height: 25)
                    .cornerRadius(10)
                
                HStack{
                    Circle()
                        .fill(Color.courseGreen)
                        .frame(width: self.backgroundOffset == 0 ? 30 : 20, height: self.backgroundOffset == 0 ? 30 : 20)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                        )
                        .onTapGesture {
                            self.backgroundOffset = 0
                        }
                    
//                    Circle()
//                        .fill(Color.ruby)
//                        .frame(width: self.backgroundOffset == 1 ? 30 : 20, height: self.backgroundOffset == 1 ? 30 : 20)
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 5)
//                        )
//                        .onTapGesture {
//                            self.backgroundOffset = 1
//                        }
//
//                    Circle()
//                        .fill(Color.yellow2 )
//                        .frame(width: self.backgroundOffset == 2 ? 30 : 20, height: self.backgroundOffset == 2 ? 30 : 20)
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 5)
//                        )
//                        .onTapGesture {
//                            self.backgroundOffset = 2
//                        }
//
                    Circle()
                        .fill(Color.gray )
                        .frame(width: self.backgroundOffset == 1 ? 30 : 20, height: self.backgroundOffset == 1 ? 30 : 20)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                        )
                        .onTapGesture {
                            self.backgroundOffset = 1
                        }
                }
                .animation(.easeIn)
            }
           .position(x:g.size.width/2, y:g.size.height/10)
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
                    
                    if self.backgroundOffset < 1 {
                        self.backgroundOffset += 1
                    }
                   
                }
            })
        )
    }
}
