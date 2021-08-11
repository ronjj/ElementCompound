//
//  EditingCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/28/21.
//

import SwiftUI


enum EditingCourseSheets: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    case courseInfo
}


struct EditingCourseView: View {
    
   
    @Binding var isShowingEditDetail: Bool
    
    var body: some View {
        ZStack {
            Color.ruby.edgesIgnoringSafeArea(.all)
            
                Spacer()
                
                VStack{
                    Spacer()
                    
                    Image("editingCourse7")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal,10)
                        .padding(.bottom, 12)
                        .frame(width: UIScreen.screenWidth, height: 400)
                    
                    
                  Button{
                      isShowingEditDetail = true
                  } label: {
                      smallButtonStyle(title: "More Info")
                  }
                  .padding(.top, 30)
                    Spacer()
                }
                .blur(radius: isShowingEditDetail ? 20 : 0)
                Spacer()
            
            if isShowingEditDetail{
                EditingCourseSheet(isShowingEditDetail: $isShowingEditDetail)
            }
        }
        
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
//        .sheet(item: $activeSheet) { item in
//            switch item {
//            case .courseInfo:
//                EditingCourseSheet()
//            }
//        }
    }
}
