//
//  AnnouncementEditView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import Firebase

struct AnnouncementAddView: View {
    
    @StateObject var viewModel = AnnoucnementViewModel()
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Title")) {
                    TextEditor(text:$viewModel.announcement.title)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                Section(header: Text("Message")) {
                    TextEditor(text:$viewModel.announcement.message)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationTitle("New Announcement")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        handleCancelTapped()
                    }) {
                        Text("Cancel")
                    }
                    
                    Button(action: {
                        handleDoneTapped()
                        self.viewModel.sendMessageTouser(to: viewModel.ReceiverFCMToken, title: self.viewModel.announcement.title, body: self.viewModel.announcement.message)
                    }) {
                        Text("Send")
                    }
                    .disabled(!viewModel.modified)
                }
                
            }
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func handleCancelTapped() {
        dismiss()
    }
    
    func handleDoneTapped() {
        viewModel.save()
        dismiss()
    }

    
}
struct AnnouncementEditView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementAddView()
    }
}



 

