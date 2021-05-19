//
//  InventoryListCellView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI

struct InventoryListCellView: View {
    
    let image: String
    let title: String
    let description: String
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]

    
    var body: some View {

        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)
        
        
        HStack(spacing: 15) {
            
            HStack{
                Rectangle()
                    .foregroundColor(colors.randomElement())
                    .frame(width: 10, height: 140)
            }
            
            Spacer()
            
            HStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 120)
                    .cornerRadius(8)
            
  

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(description)
                    .foregroundColor(Color.darkGrey)
                    .font(.footnote)
                    .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
            
                }
            Spacer()
            }
        
        }
        .frame(width: 360, height: 140)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
    }
}
