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
    @State private var newAssigned = ""
    @Environment(\.presentationMode) var presentationMode
    static let completionLevels = ["Idea", "Filming", "Processing", "Rough Cut", "Final Cut", "Complete", "Posted"]
    static let priorityLevels = ["Low", "Medium", "High"]
    
    var body: some View {
        NavigationView{
            List{
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
                
                Section(header: Text("Priority")) {
                    Picker("Priority Level", selection: $viewModel.project.priority) {
                        ForEach(Self.priorityLevels, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Stage")) {
              
                    Picker("Completion Level", selection: $viewModel.project.completionLevel) {
                        ForEach(Self.completionLevels, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Assigned")) {
                    ForEach(viewModel.project.assignedStudents, id: \.self) { assignedStudent in
                        Text(assignedStudent)
                    }
                    .onDelete { indices in
                        viewModel.project.assignedStudents.remove(atOffsets: indices)
                    }
                    HStack {
                        TextField("New Person", text: $newAssigned)
                        Button(action: {
                            withAnimation {
                                viewModel.project.assignedStudents.append(newAssigned)
                                newAssigned = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .accessibilityLabel(Text("Add new person"))
                        }
                        .disabled(newAssigned.isEmpty)
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
