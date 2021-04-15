//
//  MiscItemDetailedView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/15/21.
//

//
//  InventoryItemDetailedView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/29/21.
//

import SwiftUI

struct MiscItemDetailedView: View {
    
    
    let misc: MiscItem
   
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading, spacing: 20) {
                        Image(misc.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                         
                        Text(misc.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(misc.longDescription)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        Text("Tutorials for \(misc.name)")
                        Rectangle()
                        Rectangle()
                            
                            
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                    .navigationBarTitle(misc.name, displayMode: .inline)
                    .navigationBarHidden(true)
                  
                }
            }
        }
    }
}

struct MiscItemDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MiscItemDetailedView(misc: MockData.sampleMisc)
    }
}

