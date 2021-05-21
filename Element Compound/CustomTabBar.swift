//
//  CustomTabBar.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/19/21.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State var selectedTab = "home"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab){
                HomeView2()
                    .tag("home")
                
                InventoryListView(camera: MockData.sampleCamera, computer: MockData.sampleComputer, audio: MockData.sampleAudio, misc: MockData.sampleMisc)
                    .tag("inventory")
                
//                ProjectsView()
                   // .tag("projects")
                         
             //   CoursesView()
                  //  .tag("courses")
                
                SettingsView()
                    .tag("settings")
           
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all,edges: .bottom)
            
            HStack(spacing: 0){
                ForEach(tabs,id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .padding(.horizontal)
            .padding(.bottom,edge!.bottom == 0 ? 20: 0 )
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

var tabs = ["home", "inventory", "settings"]

struct TabButton: View{
    var image: String
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: {selectedTab = image}) {
            Image(image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color("tab") : Color.black.opacity(0.4))
                .padding()
        }
    }
}
