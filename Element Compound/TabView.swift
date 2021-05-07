//
//  TabView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI

struct TabViewItem: View {
    var body: some View {
        TabView{
            HomeView2()
              .tabItem{
                  Image(systemName:"house")
                  Text("Home")
              }
            
            InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
                .tabItem{
                    Image(systemName:"list.bullet")
                    Text("Equipment")
                }
            
//            ProjectsView()
//              .tabItem{
//                  Image(systemName:"note.text")
//                  Text("Projects")
//              }
            
//            CoursesView()
//              .tabItem{
//                  Image(systemName:"folder.fill")
//                  Text("Courses")
//            }
            
           SettingsView()
              .tabItem{
                  Image(systemName:"gear")
                  Text("Settings")
            }
        }
    }
}

struct TabViewItem_Previews: PreviewProvider {
    static var previews: some View {
        TabViewItem()
    }
}
