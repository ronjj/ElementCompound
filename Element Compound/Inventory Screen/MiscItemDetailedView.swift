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
                    
                    Image(misc.bigImageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 200)
                        .cornerRadius(8)
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                      
                         
                        Text(misc.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(misc.longDescription)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        Text("Tutorials for \(misc.name)")
                        Rectangle()
                        Rectangle()
                            
                            
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 600, alignment: .center)
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

