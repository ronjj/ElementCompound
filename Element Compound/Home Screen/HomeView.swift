//
//  Home.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    @State private var showingAddView = false
    @ObservedObject var announcements = Announcements()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(announcements.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.text)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddView = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddView) {
                AnnounceAddView(announcements: self.announcements)
                
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(announcements: Announcements())
    }
}
