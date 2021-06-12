////
////  TabView.swift
////  Element Compound
////
////  Created by Ronald Jabouin on 4/16/21.
////
//
import SwiftUI

struct TabViewItem: View {
    @State var index = 0
    var body: some View {
        
        VStack{
            ZStack{
                if self.index == 0{
                    HomeView2()
                }
                else if self.index == 1{
                    InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
                }
                else if self.index == 2{
                    Color.red.opacity(0.5).edgesIgnoringSafeArea(.all)
                    
                    Text("Courses")
                        .font(.largeTitle)
                }
                else if self.index == 3{
                    Color.pink.edgesIgnoringSafeArea(.all)
                    
                    Text("Projects")
                        .font(.largeTitle)
                }
                else{
                    SettingsView()
                }
                
                CustomTabBar(index: $index)
            }
           // .animation(.easeOut(duration: 0.5))
        }

//        TabView{
//            HomeView2()
//              .tabItem{
//                  Image(systemName:"house")
//                  Text("Home")
//              }
//
//            InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
//                .tabItem{
//                    Image(systemName:"list.bullet")
//                    Text("Equipment")
//                }
//
//
//           SettingsView()
//              .tabItem{
//                  Image(systemName:"gear")
//                  Text("Settings")
//            }
//        }
        
//        ProjectsView()
//              .tabItem{
//                  Image(systemName:"note.text")
//                  Text("Projects")
//              }
//
//            CoursesView()
//              .tabItem{
//                  Image(systemName:"folder.fill")
//                  Text("Courses")
//            }
    }
}


//

