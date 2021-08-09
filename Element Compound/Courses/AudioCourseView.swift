//
//  AudioCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/28/21.
//


import SwiftUI


enum AudioCourseSheets: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    case courseInfo
}


struct AudioCourseView: View {
    
    @State private var activeSheet: CameraCourseSheets?

    var body: some View {
        ZStack {
            Color.yellow2.edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            VStack {
                Spacer()
                
                Image("audioCourse4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal,10)
                    .padding(.bottom, 60)
                    .frame(width: UIScreen.screenWidth, height: 400)
                
                
              Button{
                  activeSheet = .courseInfo
              } label: {
                  mediumButtonStyle(title: "Go To Course")
              }
              .padding(.top, 30)
                Spacer()
            }
            Spacer()
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .sheet(item: $activeSheet) { item in
            switch item {
            case .courseInfo:
                AudioCourseSheet()
            }
        }
    }
}
