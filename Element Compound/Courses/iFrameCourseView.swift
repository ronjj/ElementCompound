//
//  iFrameCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 8/10/21.
//


import SwiftUI
import UIKit
import WebKit





struct iFrameCourseView: View {
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
                
                WebView()
            
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
    }
}
