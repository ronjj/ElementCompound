//
//  CameraDetailView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/11/21.
//

//Deprecated

import SwiftUI

struct CameraDetailView2: View {
    
    let camera: CameraItem
    
    var body: some View {
        NavigationView{
        
        ZStack{
            Color(.black)
                .edgesIgnoringSafeArea(.all)
     
                ScrollView{
                    ProductView(camera: camera)
                    Spacer()
                    CardView(camera: camera)
                        .offset(y:-15)
                        
            
           }
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


//Make into seperate file
struct ProductView: View {
    let camera: CameraItem
    var body: some View {
        VStack{
           
            VStack(alignment: .center, spacing: 20) {
                Image(camera.bigImageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardView: View {
    let camera: CameraItem
    @State private var quantity = 1

    var body: some View {
        
        VStack{
            VStack{
                Text(camera.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(quantity)")
                    .foregroundColor(.secondary)
            }
            
            .frame(maxWidth: .infinity,  alignment: .leading)
            
            HStack {
                Stepper("\(quantity)"){
                    quantity += 1
                } onDecrement: {
                    quantity -= 1
                }
                .frame(width:120)
                Spacer()
                Text("$\(quantity)")
                    .font(.largeTitle)
                    .bold()
            }
            .padding(.vertical)
        
            
            HStack{
                Image(systemName: "heart")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.trailing)
                
                Button{
                    
                } label: {
                    Spacer()
                    Text("add to cart")
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                }
                .padding()
                .background(Color(.orange))
                .cornerRadius(30)
            }
            .padding(.bottom)
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(30)
        
    }
}

//it's probably one of the paddings. if not, need to make them overlay each other

