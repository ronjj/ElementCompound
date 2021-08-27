//
//  InventoryListCellView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import URLImage

struct InventoryIconCellView: View {
    
    let images: String
    let title: String
    let description: String
    let color: Color
    let colors = [Color.yellow2,Color.ruby, Color.nyanza, Color.independence]
    
    
    var body: some View {
            AsyncImage(url: URL(string: "\(images)" ) ?? URL(string: "www.apple.com")!,
                       placeholder: {
                LoadingView()
            },
                       image: {
                Image(uiImage: $0).resizable()
            })
                .aspectRatio(contentMode: .fill)
//                .frame(width: 180, height: 180)
                .frame(width: UIScreen.screenWidth/2.5, height: UIScreen.screenHeight/2.5)
                .cornerRadius(8)
            
       
    }
}
