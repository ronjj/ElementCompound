//
//  iFrameCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 8/10/21.
//


import SwiftUI
import UIKit
import WebKit


struct WebView: UIViewRepresentable {

    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }

    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebView>) {

        let request = URLRequest(url: URL(string: "https://www.picktime.com/elementchs")!)

        view.load(request)
    }
}


struct iFrameCourseView: View {
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
                
                WebView()
            
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
    }
}
