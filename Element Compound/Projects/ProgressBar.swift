//
//  ProgressBar.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/18/21.
//

import SwiftUI

struct ProgressBar: View {
    
    @ObservedObject var viewModel = ProjectViewModel2()
    
    var width: CGFloat = 200
    var height: CGFloat = 20
   
    var percent: CGFloat = 70
    var color1 = Color.red
    var color2 = Color.blue

    
    var body: some View {
       let multiplier = width / 100
        
//        if completionLevel = "Idea"{
//            percent = 10
//        }
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: CGFloat(viewModel.project.percentComplete) * multiplier, height: height)
                .background(LinearGradient(gradient: Gradient(colors:[color1, color2]), startPoint: .leading,endPoint: .trailing)
                                .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }
    }
}



//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar()
//    }
//}
