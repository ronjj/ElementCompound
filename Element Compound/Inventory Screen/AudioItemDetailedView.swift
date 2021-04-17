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
                    VStack(alignment: .leading, spacing: 20) {
                        Image(audio.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                         
                        Text(audio.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(audio.longDescription)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        Text("Tutorials for \(audio.name)")
                        Rectangle()
                        Rectangle()
                            
                            
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
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

