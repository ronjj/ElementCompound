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
    
   
    @Binding var isShowingAudioDetail: Bool

    var body: some View {
        ZStack {
            Color.yellow2.edgesIgnoringSafeArea(.all)
            
                Spacer()
                
                VStack{
                    Spacer()
                    
                    Image("audioCourse8")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal,10)
                        .padding(.bottom, 12)
                        .frame(width: UIScreen.screenWidth, height: 400)
                    
                    
                  Button{
                      isShowingAudioDetail = true
                  } label: {
                      smallButtonStyle(title: "More Info")
                  }
                  .padding(.top, 30)
                    Spacer()
                }
                .blur(radius: isShowingAudioDetail ? 20 : 0)
                Spacer()
            
            if isShowingAudioDetail{
                AudioCourseSheet(isShowingAudioDetail: $isShowingAudioDetail)
            }
        }

        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)

//        .sheet(item: $activeSheet) { item in
//            switch item {
//            case .courseInfo:
//                AudioCourseSheet()
//            }
//        }
    }
}

