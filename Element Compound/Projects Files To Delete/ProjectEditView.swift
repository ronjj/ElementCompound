////
////  ProjectEditView.swift
////  Element Compound
////
////  Created by Ronald Jabouin on 6/18/21.
////
//
//import SwiftUI
//import Firebase
//
//enum Mode {
//  case new
//  case edit
//}
//
//enum Action {
//  case delete
//  case done
//  case cancel
//}
//
//struct ProjectEditView: View {
//
//    @StateObject var viewModel = ProjectViewModel2()
//    @Environment(\.presentationMode) var presentationMode
//    @State var presentActionSheet = false
//    var mode: Mode = .new
//    var completionHandler: ((Result<Action, Error>) -> Void)?
//    @AppStorage ("role_Status") var role = Bool()
//
//
//    @State private var newAssigned = ""
//    static let completionLevels = ["Idea", "Filming", "Processing", "Rough Cut", "Final Cut", "Complete", "Posted"]
//    static let priorityLevels = ["Low", "Medium", "High"]
//
//    var cancelButton: some View {
//      Button(action: { self.handleCancelTapped() }) {
//        Text("Cancel")
//      }
//    }
//
//    var saveButton: some View {
//      Button(action: {
//          self.handleDoneTapped()
////          self.viewModel.sendMessageTouser(to: viewModel.ReceiverFCMToken, title: self.viewModel.project.title, body: self.viewModel.project.creator)
//
//      }) {
//        Text(mode == .new ? "Done" : "Save")
//      }
//      .disabled(!viewModel.modified)
//    }
//
//
//    var body: some View {
//        NavigationView{
////            List{
////                Section(header: Text("Title")) {
////                    TextEditor(text:$viewModel.project.title)
////                        .font(.custom("SF Pro", size: 18))
////                        .frame(height: 125, alignment: .center)
////                        .foregroundColor(.gray)
////                        .multilineTextAlignment(.leading)
////                }
////
////                Section(header: Text("Due Date")) {
////                    DatePicker("Choose Date", selection: $viewModel.project.dueDate)
////                }
////
////                Section(header: Text("Priority")) {
////                    Picker("Priority Level", selection: $viewModel.project.priority) {
////                        ForEach(Self.priorityLevels, id: \.self) {
////                            Text($0)
////                        }
////                    }.pickerStyle(SegmentedPickerStyle())
////                }
////
////                Section(header: Text("Stage")) {
////
////                    Picker("Completion Level", selection: $viewModel.project.completionLevel) {
////                        ForEach(Self.completionLevels, id: \.self) {
////                            Text($0)
////                        }
////                    }
////                }
////
////                Section(header: Text("Assigned")) {
////                    ForEach(viewModel.project.assignedStudents, id: \.self) { assignedStudent in
////                        Text(assignedStudent)
////                    }
////                    .onDelete { indices in
////                        viewModel.project.assignedStudents.remove(atOffsets: indices)
////                    }
////                    HStack {
////                        TextField("New Person", text: $newAssigned)
////                        Button(action: {
////                            withAnimation {
////                                viewModel.project.assignedStudents.append(newAssigned)
////                                newAssigned = ""
////                            }
////                        }) {
////                            Image(systemName: "plus.circle.fill")
////                                .accessibilityLabel(Text("Add new person"))
////                        }
////                        .disabled(newAssigned.isEmpty)
////                    }
////                }
////
////                Section(header: Text("Project Notes")){
////                    TextEditor(text: $viewModel.project.notes)
////                        .frame(height: 125, alignment: .center)
////                        .foregroundColor(.gray)
////                        .multilineTextAlignment(.leading)
////                }
////
////                if mode == .edit {
////                  Section {
////                    Button("Delete project") { self.presentActionSheet.toggle() }
////                      .foregroundColor(.red)
////                  }
////                }
////            }
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    saveButton
//
//                }
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    cancelButton
//
//                }
//            }
//            .navigationTitle(mode == .new ? "New Project" : viewModel.project.title)
//            .actionSheet(isPresented: $presentActionSheet) {
//              ActionSheet(title: Text("Are you sure?"),
//                          buttons: [
//                            .destructive(Text("Delete project"),
//                                         action: { self.handleDeleteTapped() }),
//                            .cancel()
//                          ])
//            }
//
//        }
//    }
//
//    func handleCancelTapped() {
//      self.dismiss()
//    }
//
//    func handleDoneTapped() {
//      self.viewModel.handleDoneTapped()
//      self.dismiss()
//    }
//
//    func handleDeleteTapped() {
//      viewModel.handleDeleteTapped()
//      self.dismiss()
//      self.completionHandler?(.success(.delete))
//    }
//
//    func dismiss() {
//      self.presentationMode.wrappedValue.dismiss()
//    }
//}
//
//
//
