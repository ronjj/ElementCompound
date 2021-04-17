//
//  InventoryItemDetailedView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/29/21.
//

import SwiftUI

struct CameraItemDetailedView: View {
    
    
    let camera: CameraItem
   
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading, spacing: 20) {
                        Image(camera.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                            .frame(width: 300, height: 225)
                         
                        Text(camera.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(camera.longDescription)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        Text("Tutorials for \(camera.name)")
                        Rectangle()
                        Rectangle()
                            
                            
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                    .navigationBarTitle(camera.name, displayMode: .inline)
                    .navigationBarHidden(true)
                  
                }
            }
        }
    }
}

struct CameraItemDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        CameraItemDetailedView(camera: MockData.sampleCamera)
    }
}

