//
//  CourseSectionCardView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/27/21.
//

//
//  InventoryListCellView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import URLImage

struct CourseSectionCardView: View {
    
    let name: String
    let description: String
    let image: String
    
    let colors = [Color.yellow2,Color.ruby, Color.nyanza, Color.independence]
    
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,10)
             
            Text(name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
             
            Text(description)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
        }
    }
}
