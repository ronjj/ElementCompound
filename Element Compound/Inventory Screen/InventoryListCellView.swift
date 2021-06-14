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
    let color: Color
    let colors = [Color.yellow2,Color.ruby, Color.nyanza]
    
    
    var body: some View {
        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)

            HStack(spacing: 15) {
                HStack{
                    Rectangle()
                        //.foregroundColor(colors.randomElement())
                        .foregroundColor(color)
                        .frame(width: 10, height: 140)
                }
                
                HStack{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 90)
                        .cornerRadius(8)
                        .padding(.trailing, 5)
                          
                    VStack(alignment: .leading, spacing: 5) {
                        Text(title)
                            .foregroundColor(Color.bginv)
                            .font(.title2)
                            .fontWeight(.medium)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(description)
                            .foregroundColor(Color.darkGrey)
                            .font(.footnote)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.bginv)
                        .font(.caption)
                        .padding(.horizontal, 8)
                    
                }
            }
        }
        .frame(width: 360, height: 140)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
    }
}
