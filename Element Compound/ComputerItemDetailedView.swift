//
//  InventoryItemDetailedView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/29/21.
//

import SwiftUI

struct ComputerItemDetailedView: View {
    
    let computer: ComputerItem
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading, spacing: 20) {
                        Image(computer.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                         
                        Text(computer.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(computer.longDescription)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        Text("Tutorials for \(computer.name)")
                        Rectangle()
                        Rectangle()
                            
                            
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                    .navigationBarTitle(computer.name, displayMode: .inline)
                    .navigationBarHidden(true)
                  
                }
            }
        }
    }
}

struct ComputerItemDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        ComputerItemDetailedView( computer: MockData.sampleComputer)
    }
}

