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
            WebView().edgesIgnoringSafeArea(.all)
                .blur(radius: isShowingiFrameDetail ? 20 : 0)
            
            HStack{
                Button{
                    isShowingiFrameDetail = true
                } label: {
                    Image("dinoInfo")
                        .resizable()
                       // .imageScale(.small)
                        .frame(width: 50, height: 50)
                        //.aspectRatio( contentMode: .fill)
                        .padding(.leading, 40)
                        .position(y: UIScreen.screenHeight/9)
                }
                .padding()
                
                .blur(radius: isShowingiFrameDetail ? 20 : 0)
                
                Spacer()
            }
                        
            if isShowingiFrameDetail{
                iFrameCourseSheet(isShowingiFrameDetail: $isShowingiFrameDetail)
                    
            }
        }
    }
}

struct CoursesView2_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView2()
    }
}
