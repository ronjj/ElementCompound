//
//  AnnouncementEditView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import Firebase
import Combine
import FirebaseMessaging
import UserNotifications

enum Mode2 {
    case new
    case edit
}

enum Action2 {
    case delete
    case done
    case cancel
}


struct AnnouncementAddView: View {
    
    @StateObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode
    //let sender = PushNotificationSender()
    let textLimit = 21
    let textLimit2 = 90
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    
    
    @State var presentActionSheet = false
    var mode: Mode2 = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    
    var cancelButton: some View {
        Button(action: { self.handleCancelTapped() }) {
            Text("Cancel")
        }
    }
    
    var saveButton: some View {
        Button(action: { self.handleDoneTapped() }) {
            Text(mode == .new ? "Done" : "Save")
        }
        .disabled(!viewModel.modified)
    }

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Title")) {
                    TextEditor(text:$viewModel.announcement.title)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .onReceive(Just(viewModel.announcement.title)) { _ in limitText(textLimit) }
                   
                }
                
                Section(header: Text("Message")) {
                    TextEditor(text:$viewModel.announcement.message)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .onReceive(Just(viewModel.announcement.message)) { _ in limitText2(textLimit2) }
                }
                if mode == .edit {
                    Section {
                        Button("Delete Announcement") { self.presentActionSheet.toggle() }
                            .foregroundColor(.red)
                    }
                }
                
          
            }
            .navigationTitle(mode == .new ? "New Announcement" : "Edit Announcement")
            .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
            .navigationBarItems(
                leading: cancelButton,
                trailing: saveButton
            )
            .actionSheet(isPresented: $presentActionSheet) {
                ActionSheet(title: Text("Are you sure?"),
                            buttons: [
                                .destructive(Text("Delete Announcement"),
                                             action: { self.handleDeleteTapped() }),
                                .cancel()
                            ])
            }
        }
    }
    
    func handleCancelTapped() {
        self.dismiss()
    }
    
    func handleDoneTapped() {
        self.viewModel.handleDoneTapped()
        self.dismiss()
    }
    
    func handleDeleteTapped() {
        viewModel.handleDeleteTapped()
        self.dismiss()
        self.completionHandler?(.success(.delete))
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }


    func limitText(_ upper: Int) {
            if viewModel.announcement.title.count > upper {
                viewModel.announcement.title = String(viewModel.announcement.title.prefix(upper))
            }
        }
    
    func limitText2(_ upper: Int) {
            if viewModel.announcement.message.count > upper {
                viewModel.announcement.message = String(viewModel.announcement.message.prefix(upper))
            }
        }
}


 

