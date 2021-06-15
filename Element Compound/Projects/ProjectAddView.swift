//
//  AnnouncementEditView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/30/21.
//

import SwiftUI
import Firebase

struct ProjectAddView: View {
    
    @StateObject var viewModel = ProjectViewModel()
    @Environment(\.presentationMode) var presentationMode
    static let completionLevels = ["Idea", "Filming", "Processing", "Rough Cut", "Final Cut", "Complete", "Posted"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Title")) {
                    TextEditor(text:$viewModel.project.title)
                        .font(.custom("SF Pro", size: 18))
                        .frame(height: 125, alignment: .center)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                Section(header: Text("Due Date")) {
                    DatePicker("Choose Date", selection: $viewModel.project.dueDate)
                }
                
                Section(header: Text("Stage")) {
                    Picker("Completion Level", selection: $viewModel.project.completionLevel) {
                        ForEach(Self.completionLevels, id: \.self) {
                            Text($0)
                        }
                    }
                }
                                    
//                Section(header: Text("Project Notes")){
//                    TextField("text", text: $viewModel.project.extraInfo)
//                        .frame(height: 125, alignment: .center)
//                        .foregroundColor(.gray)
//                        .multilineTextAlignment(.leading)
//                }
             
                
            }
            .navigationTitle("New Project")
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        handleCancelTapped()
                    }) {
                        Text("Cancel")
                    }
                    
                    Button(action: {
                        handleDoneTapped()
                        self.viewModel.sendMessageTouser(to: viewModel.ReceiverFCMToken, title: self.viewModel.project.title, body: self.viewModel.project.creator)
                    }) {
                        Text("Create")
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
