//
//  Home.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Test!")
                .navigationTitle("Home")
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
