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
    @Binding var backgroundOffset: CGFloat
    
    var body: some View {
       
        ZStack {
            Color.ruby.edgesIgnoringSafeArea(.all)
            
            Group {
                    Image("Courses2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal,10)
                        .padding(.bottom, 12)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight-300)
                       
                    
                    VStack{
                        Spacer()
                        
                        Button{
                            isShowingCameraDetail = true
                        } label: {
                            circularButtonStyle(title: "Course Info")
                        }
                        .shadow(color: .black, radius: 3)
                        .padding(.bottom, 160)
                      
                        
                        Button{
                            backgroundOffset = 1
                        } label: {
                            circularButtonStyle(title: "Sign Up")
                        }
                        .shadow(color: .black, radius: 3)
                        
                        
                        Spacer()
                    }
            }
            .blur(radius: isShowingCameraDetail ? 20 : 0)
            
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

