//
//  CameraDetailView4.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/15/21.
//

import SwiftUI

struct AudioItemDetailedView: View {
    
    let audio: AudioItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
//            CustomNavigationBar()
//               .padding(.horizontal)
//               .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            GeometryReader{ reader in
                
                //Type 1
//                Image(camera.bigImageURL)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .offset(y: -reader.frame(in: .global).minY)
//                    .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 480)
                
                
//                Type 2
                if  reader.frame(in: .global).minY > -480 {
                Image(audio.bigImageURL)
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
                Text(audio.name)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)

                Text(audio.longDescription)
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
                        .frame(width: 350, height: 75)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 75)
                }
                
                VStack(alignment: .leading) {
                    Text("Courses")
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 75)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 75)
                }
                
            }
            .padding(.top,25)
            .padding(.horizontal)
            .background(Color.black)
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
            .offset(y: -30)
        })
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width:30, height: 30)
              Image(systemName: "arrow.left")
                .foregroundColor(.black)
            }
        })
       // .navigationBarItems(leading: btnBack)
        //.navigationBarHidden(true)
    
    }
}

