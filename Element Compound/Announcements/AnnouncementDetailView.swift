
//  AnnouncementCardView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/22/21.


import SwiftUI
import Firebase
import GoogleSignIn




struct AnnouncementDetailView: View {
    @AppStorage ("role_Status") var role = Bool()
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditAnnouncementSheet = false
    @ObservedObject private var viewModel = AnnouncementsViewModel()
    var announcement: Announcement
    
    private func editButton(action: @escaping () -> Void) -> some View {
        Button(action: { action() }) {
            Text("Edit")
        }
    }
    
    var body: some View {
       
        ZStack{
            Color.lightBlue.edgesIgnoringSafeArea(.all)
            
            ScrollView{
                HStack {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() },
                           label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.bginv)
                                .frame(width:30, height: 30)
                          Image(systemName: "arrow.left")
                            .foregroundColor(.bg)
                        }
                    })
                    
                    Text(announcement.title)
                        .font(.largeTitle)
                        .foregroundColor(.bginv)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                    
                    Spacer()
                    
                    Button{
                        self.presentEditAnnouncementSheet.toggle()
                    } label: {
                        Text("Edit")
                    }
                    .disabled(role == false)
                    .opacity(role ? 1.0 : 0.0)
                }
                .padding()
                    
                VStack(alignment: .leading){
                    
                    LinkedText(announcement.message)
                        //Text(announcement.message)
                        .padding(.bottom, 10)
                        .font(.body)
                        .minimumScaleFactor(0.4)
                    
                    Text(announcement.sender)
                        .font(.body)
                    
                    Text(announcement.dateString)
                        .font(.body)
                    
                    Text(announcement.timeString)
                        .font(.body)
                }
                .padding()
            }
        }
        
        .navigationBarHidden(true)
        .onAppear() {
            print("BookDetailsView.onAppear() for \(self.announcement.title)")
        }
        
        .sheet(isPresented: self.$presentEditAnnouncementSheet) {
            AnnouncementAddView(viewModel: AnnoucnementViewModel(announcement: announcement), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}




