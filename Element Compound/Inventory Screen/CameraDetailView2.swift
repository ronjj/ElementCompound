//
//  CameraDetailView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/11/21.
//

import SwiftUI

struct CameraDetailView2: View {
    var body: some View {
        ZStack{
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                ProductView()
                Spacer()
                CardView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CameraDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        CameraDetailView2()
    }
}

//Make into seperate file
struct ProductView: View {
    var body: some View {
        VStack{
                Image("Mavic Mini 2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width)
        
    }
}

struct CardView: View {
    
    @State private var quantity = 1
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Lumix GH4")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(quantity) each")
                    .foregroundColor(.secondary)
                
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("Product Description")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Lorem ipsum decorem")
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical)
            
        }
        .padding()
        .background(Color(.systemBackground))
        //.cornerRadius(30)
    }

}

