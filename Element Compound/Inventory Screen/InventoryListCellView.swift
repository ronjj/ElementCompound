//
//  InventoryListCellView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import URLImage

struct InventoryListCellView: View {
    
    let images: String
    let title: String
    let description: String
    let color: Color
    let colors = [Color.yellow2,Color.ruby, Color.nyanza, Color.independence]
    
    
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
                    AsyncImage(url: URL(string: "\(images)" ) ?? URL(string: "www.apple.com")!,
                               placeholder: {
                        LoadingView()
                    },
                               image: {
                        Image(uiImage: $0).resizable()
                    })
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 90)
                        //.frame(minWidth: 120,  maxWidth: 90, minHeight: 240,  maxHeight: 180)
                        .cornerRadius(8)
                       
                    
                    //                   Image(images)
                    //                        //.resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: 120, height: 90)
                    //                        .cornerRadius(8)
                    //                        .padding(.trailing, 5)
                    
                    //                    URLImage(posters,
                    //                             content: { image in
                    //                                 image
                    //                                     .resizable()
                    //                                     .aspectRatio(contentMode: .fit)
                    //                             })
                    
                    //                    InventoryRemoteImage(urlString: image)
                    //                        .resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: 120, height: 90)
                    //                        .cornerRadius(8)
                    //                        .padding(.trailing, 5)
                    
                    //                    AsyncImage(url: URL(string: images)!, placeholder: {Color.black}, image: { image in
                    //                        Image(uiImage: image).resizable()
                    //                    })
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: 120, height: 90)
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(title)
                            .foregroundColor(Color.bginv)
                            .font(.title3)
                            .fontWeight(.medium)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.6)
                        
                        Text(description)
                            .foregroundColor(Color.darkGrey)
                            .font(.footnote)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.2)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.bginv)
                        .font(.caption)
                        .padding(.horizontal, 8)
                }
            }
        }
        //.frame(width: 360, height: 140)
        .frame(minWidth: 360, maxWidth: 720, minHeight: 140, maxHeight: 280)
        .cornerRadius(20)
        .shadow(color: .bg, radius: 30, x: 0, y: 15)
    }
}
