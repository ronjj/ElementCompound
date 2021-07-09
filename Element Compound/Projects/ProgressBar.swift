//
//  ProgressBar.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/18/21.
//

import SwiftUI

struct ProgressBar: View {
    
    
    var width: CGFloat = 200
    var height: CGFloat = 20
   
    var percent: Double = 70
    var color1 = Color.red
    var color2 = Color.blue

    
    var body: some View {
       let multiplier = width / 100
    
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: CGFloat(percent) * multiplier, height: height)
                .background(LinearGradient(gradient: Gradient(colors:[color1, color2]), startPoint: .leading,endPoint: .trailing)
                                .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }
    }
}


