//
//  ContentView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage ("log_Status") var status = false
    var body: some View {
        
        ZStack{
            if status {
                TabViewItem()
            }
            else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}