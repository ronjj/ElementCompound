//
//  ButtonStyle.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/13/21.
//


import SwiftUI

struct ButtonStyle: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            //.frame(width: 260, height: 50)
            .frame(width: 140, height: 50)
            .foregroundColor(Color.accentColor)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle(title: "test title")
    }
}
