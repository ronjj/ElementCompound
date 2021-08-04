//
//  CourseSheets.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/29/21.
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



struct CameraCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Button{
                    self.dismiss()
                } label: {
                     Text("Cancel")
                            .foregroundColor(.bginv)
                }
                .padding()
            }
            
            Text("Camera Course")
                .padding()
                .font(.title)
            
            Text("Book An Appoitment Below")
                .font(.subheadline)
            
            WebView().edgesIgnoringSafeArea(.all)
        }
    }
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct EditingCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Button{
                    self.dismiss()
                } label: {
                     Text("Cancel")
                            .foregroundColor(.bginv)
                }
                .padding()
            }
            
            Text("Editing Course")
                .padding()
                .font(.title)
            
            Text("Book An Appoitment Below")
                .padding()
                .font(.subheadline)
            
            WebView().edgesIgnoringSafeArea(.all)
        }
    }
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}


struct AudioCourseSheet: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    self.dismiss()
                } label: {
                     Text("Cancel")
                            .foregroundColor(.bginv)
                }
                .padding()
            }
            
            Text("Audio Course")
                .padding()
                .font(.title)
            
            Text("Book An Appoitment Below")
                .padding()
                .font(.subheadline)
            
            WebView().edgesIgnoringSafeArea(.all)
        }
    }
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
