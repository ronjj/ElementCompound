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
            .font(.caption)
            .fontWeight(.semibold)
            //.frame(width: 260, height: 50)
            .frame(width: 100, height: 35)
            .foregroundColor(Color.accentColor)
            .background(Color.bg)
            .cornerRadius(10)
    }
}


struct mediumButtonStyle: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .foregroundColor(.bg)
            .background(Color.bginv)
            .cornerRadius(20)
    }
}



struct largeButtonStyle: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.bg)
            .background(Color.bginv)
            .cornerRadius(10)
    }
}

struct customBgStyle : View {
    let title: LocalizedStringKey
    let textColor: Color
    let bgColor: Color
    
    var body: some View {
        Text(title)
            .font(.body)
            .fontWeight(.semibold)
            .frame(width: 120, height: 120)
            .foregroundColor(textColor)
            .background(bgColor)
            .cornerRadius(10)
    }
}


struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle(title: "test title")
    }
}
