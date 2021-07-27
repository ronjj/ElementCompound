//
//  CameraCoursesView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/27/21.
//

import SwiftUI

struct CourseSectionView: View {
    var body: some View {
        VStack{
            Image("black")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,10)
             
            Text("Camera Course")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                //.background(Color.green)
                .padding()
             
            Text("Click the link to learn the basis of using a camera")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
        }
    }
}


