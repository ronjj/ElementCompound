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
    
    var body: some View {
        HStack(spacing: 15) {
            Image(image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 120)
                .cornerRadius(8)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(description)
                    .foregroundColor(Color.darkGrey)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct InventoryListCellView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListCellView(image: MockData.sampleCamera.imageURL, title: MockData.sampleCamera.name, description: MockData.sampleCamera.shortDescription)
    }
}
