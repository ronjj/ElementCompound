//
//  CameraCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/27/21.
//

import SwiftUI



enum CameraCourseSheets: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    case courseInfo
}



struct CameraCourseView: View {
    
   
    @Binding var isShowingCameraDetail: Bool
    
    var body: some View {
       
        ZStack {
            Color.courseGreen.edgesIgnoringSafeArea(.all)
            
                Spacer()
                
                VStack{
                    Spacer()
                    
                    Image("cameraCourse4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal,10)
                        .padding(.bottom, 12)
                        .frame(width: UIScreen.screenWidth, height: 400)
                    
                    
                  Button{
                      isShowingCameraDetail = true
                  } label: {
                      smallButtonStyle(title: "More Info")
                  }
                  .padding(.top, 30)
                    Spacer()
                }
                .blur(radius: isShowingCameraDetail ? 20 : 0)
                Spacer()
            
            if isShowingCameraDetail{
                CameraCourseSheet(isShowingCameraDetail: $isShowingCameraDetail)
            }
        }

        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)

//        .sheet(item: $activeSheet) { item in
//            switch item {
//            case .courseInfo:
//                CameraCourseSheet()
//            }
//        }
    }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

