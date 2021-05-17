//
//  CustomNavigationBar.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/16/21.
//

import SwiftUI

struct CustomNavigationBar: View {
    var body: some View {
        HStack{
            Button{
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.red)
            }
        }
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
