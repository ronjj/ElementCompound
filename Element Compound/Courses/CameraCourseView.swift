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
    
    @State private var activeSheet: CameraCourseSheets?
    
    var body: some View {
        ZStack {
            Color.courseGreen.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                
                Image("cameraCourse3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal,10)
                  //  .padding(.bottom, 12)
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
                CameraCourseSheet()
            }
        }
    }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
