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
        HStack(spacing: 20) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(description)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(5)
        }
        
    }
}

struct InventoryListCellView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListCellView(image: MockData.sampleCamera.imageURL, title: MockData.sampleCamera.name, description: MockData.sampleCamera.shortDescription)
    }
}
