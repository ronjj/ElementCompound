//
//  CameraDetailView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/11/21.
//

//Deprecated

import SwiftUI

struct CameraDetailView2: View {
    var body: some View {
        
        
        ZStack{
            Color(.black)
                .edgesIgnoringSafeArea(.all)
     
                VStack{
                    Spacer()
                    ProductView()
                    Spacer()
                    CardView()
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


//Make into seperate file
struct ProductView: View {
    var body: some View {
        TabView{
            ForEach(0 ..< 5) {_ in
                Image("Rode Background Final")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width)
        .tabViewStyle(PageTabViewStyle())

    }
}

struct CardView: View {

    @State private var quantity = 1

    var body: some View {
        
        VStack{
            VStack{
                Text("Orange")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(quantity)")
                    .foregroundColor(.secondary)
            }
            .padding(.top)
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
            
            Text("Product Description ")
                .font(.title)
                .frame(width: .infinity, alignment: .leading)
            
            
            Text("Lorem ipsum")
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
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(30)
        
    }
}

