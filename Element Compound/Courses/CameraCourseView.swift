//
//  CameraCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/27/21.
//

import SwiftUI

struct CameraCourseView: View {
    var body: some View {
        ZStack {
            Color.lightBlue.edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            VStack {
                Image("black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal,10)
                    .frame(width: 200, height: 200)
                 
                Text("Cameras")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                 
                Text(" This is the camera course. Click the button below to learn more")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                  
                Button{

                } label: {
                    largeButtonStyle(title: "Go To Course")
                }
                .padding(.top, 30)
                   
            }
            Spacer()
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
    }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
