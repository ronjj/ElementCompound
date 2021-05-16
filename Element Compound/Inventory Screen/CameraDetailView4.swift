//
//  CameraDetailView4.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/15/21.
//

import SwiftUI

struct CameraDetailView4: View {
    
    let camera: CameraItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
        ZStack {
                Circle()
                    .foregroundColor(Color.white)
            
                Image(systemName: "chevron.left")
                    .foregroundColor(Color.black)
//                    .imageScale(.large)
//                    .frame(width: 40, height: 40)
            
            }
        .padding()
        }
    }
    
    var body: some View {

            btnBack
    
        ScrollView(.vertical, showsIndicators: false, content: {
            GeometryReader{ reader in
                
                //Type 1
//                Image(camera.bigImageURL)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .offset(y: -reader.frame(in: .global).minY)
//                    .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 480)
                
                
//                Type 2
                if  reader.frame(in: .global).minY > -480 {
                Image(camera.bigImageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -reader.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.width, height:
                            reader.frame(in: .global).minY > 0 ?
                            reader.frame(in: .global).minY + 480 : 480)
 
                }
            }
            .frame(height:480)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(camera.name)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)

                Text(camera.longDescription)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                VStack(alignment: .leading){
                    Text("YouTube Tutorials")
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        
                    Rectangle()
                        .foregroundColor(.white)
                    Rectangle()
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("Courses")
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Rectangle()
                        .foregroundColor(.white)
                    Rectangle()
                        .foregroundColor(.white)
                }
                
            }
            .padding(.top,25)
            .padding(.horizontal)
            .background(Color.black)
            .cornerRadius(30)
            .offset(y: -30)
        })
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        //.navigationBarBackButtonHidden(true)
       // .navigationBarItems(leading: btnBack)
        .navigationBarHidden(true)
       
    }
}

