//
//  InventoryItemDetailedView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/29/21.
//

import SwiftUI

struct AudioItemDetailedView: View {
    
    
    let audio: AudioItem
   
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    Image(audio.bigImageURL)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 200)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text(audio.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(audio.longDescription)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        Text("Tutorials for \(audio.name)")
                        Rectangle()
                        Rectangle()
                            
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 600, alignment: .center)
                    .navigationBarTitle(audio.name, displayMode: .inline)
                    .navigationBarHidden(true)
                  
                }
            }
        }
    }
}

struct AudioItemDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        AudioItemDetailedView(audio: MockData.sampleAudio)
    }
}

