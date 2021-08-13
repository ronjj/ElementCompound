//
//  CourseSheets.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/29/21.
//

import SwiftUI
import UIKit
import WebKit





struct CameraCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowingCameraDetail: Bool
    
    var body: some View {
        VStack{
            Text("Element Members are expected to attend course to better their skills and obtain club credit.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("In the camera course, students will learn...")
                .font(.body)
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(Color.bg)
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingCameraDetail = false
        } label: {
           XDismissButton()
        }, alignment: .topTrailing)
        }
}

struct iFrameCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowingiFrameDetail: Bool
    
    var body: some View {
        VStack{
            Text("Element Members are expected to attend course to better their skills and obtain club credit.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("In the camera course, students will learn...")
                .font(.body)
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(Color.bg)
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingiFrameDetail = false
        } label: {
           XDismissButton()
        }, alignment: .topTrailing)
        }
}

struct EditingCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowingEditDetail: Bool
    
    var body: some View {
      
        VStack{
            Text("Element Members are expected to attend course to better their skills and obtain club credit.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("In the editing course, students will learn...")
                .font(.body)
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(Color.bg)
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingEditDetail = false
        } label: {
           XDismissButton()
        }, alignment: .topTrailing)
    
    }
}


struct AudioCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowingAudioDetail: Bool
    
    var body: some View {
        VStack{
            Text("Element Members are expected to attend course to better their skills and obtain club credit.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("In the audio course, students will learn...")
                .font(.body)
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(Color.bg)
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingAudioDetail = false
        } label: {
           XDismissButton()
        }, alignment: .topTrailing)
    }
}
