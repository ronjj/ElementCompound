//
//  CoursesView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 8/12/21.
//

import SwiftUI

struct CoursesView2: View {
    @State var isShowingiFrameDetail = false
    var body: some View {
            ZStack{
                VStack{
                    WebView().edgesIgnoringSafeArea(.all)
                        .blur(radius: isShowingiFrameDetail ? 20 : 0)
                }
                
//                HStack{
//                    Spacer()
//                    
//                    Button{
//                        isShowingiFrameDetail = true
//                    } label: {
//                        ZStack {
//                            Circle()
//                                .foregroundColor(.white)
//                                .frame(width: 60, height: 60)
//                            Image("dinoInfo")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .aspectRatio( contentMode: .fill)
//                            //.position(y: UIScreen.screenHeight/9)
//    //                            .padding(.leading, 40)
//                            // .imageScale(.small)
//                        }
//                    }
//                    .blur(radius: isShowingiFrameDetail ? 20 : 0)
//                }
//                .padding()
//               
//                            
//                if isShowingiFrameDetail{
//                    iFrameCourseSheet(isShowingiFrameDetail: $isShowingiFrameDetail)
//                        
//                }
            }
    }
}
