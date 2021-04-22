//
//  Home.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
