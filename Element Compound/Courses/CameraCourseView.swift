//
//  CameraCourseView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/27/21.
//

import SwiftUI

struct CameraCourseView: View {
    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CameraCourseView_Previews: PreviewProvider {
    static var previews: some View {
        CameraCourseView()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
