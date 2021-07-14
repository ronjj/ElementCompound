
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
        .disabled(role == false)
    }
    
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    
    var body: some View {
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
        Spacer()
        
        
        .navigationBarTitle(announcement.title)
        .navigationBarItems(trailing: editButton {
            self.presentEditAnnouncementSheet.toggle()
        })
        .onAppear() {
            print("BookDetailsView.onAppear() for \(self.announcement.title)")
        }
        .onDisappear() {
            print("BookDetailsView.onDisappear()")
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



