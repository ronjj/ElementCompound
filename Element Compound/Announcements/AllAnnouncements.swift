//
//  AllAnnouncements.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/13/21.
//


import SwiftUI
import Firebase

struct AllAnouncements: View {
    
  
    @ObservedObject var viewModel = AnnouncementsViewModel()
    @State private var action: Int? = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  
    
    var body: some View {
            ZStack{
                Color.lightBlue.edgesIgnoringSafeArea(.all)
              

                ScrollView(showsIndicators: false){
                    HStack {
                        Button(action: { self.presentationMode.wrappedValue.dismiss() },
                               label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width:30, height: 30)
                              Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                            }
                        })
    //                            Spacer()
    //                            Button(action: { viewModel.favouriteMethod() },
    //                                   label: {
    //                                Image(IMAGE_FAV_ICON)
    //                                .resizable()
    //                                .frame(width: 26, height: 26)
    //
    //                                }
    //                            )
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                    
                    HStack {
                        Text("Equipment List")
                            .font(.largeTitle)
                            .foregroundColor(.bginv)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    
                    LazyVStack{
                        ForEach(viewModel.announcements) { announcement in
                            NavigationLink(destination: AnnouncementDetailView( announcement: announcement)) {
                                AnnouncementCardView(announcement: announcement)
                            }
                        }
                        .padding(7)
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
           // .navigationBarTitle("All Announcements")
           
          
            .onAppear(){
                self.viewModel.subscribe()
    
        }
    }
}


//struct AllAnouncements_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView2()
//    }
//}



