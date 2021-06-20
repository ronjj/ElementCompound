//
//  ProjectEditView2.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/19/21.
//



import SwiftUI

enum Mode {
  case new
  case edit
}

enum Action {
  case delete
  case done
  case cancel
}

struct ProjectEditView2: View {
  // MARK: - State
  
  @Environment(\.presentationMode) private var presentationMode
  @State var presentActionSheet = false

  // MARK: - State (Initialiser-modifiable)
  
  @ObservedObject var viewModel = ProjectViewModel2()
  var mode: Mode = .new
  var completionHandler: ((Result<Action, Error>) -> Void)?
  
  // MARK: - UI Components
  
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
  
    @State private var newAssigned = ""
       static let completionLevels = ["Idea", "Filming", "Processing", "Rough Cut", "Final Cut", "Complete", "Posted"]
       static let priorityLevels = ["Low", "Medium", "High"]
  var body: some View {
    NavigationView {
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

            Section(header: Text("Project Notes")){
                TextEditor(text: $viewModel.project.notes)
                    .frame(height: 125, alignment: .center)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }

            if mode == .edit {
              Section {
                Button("Delete project") { self.presentActionSheet.toggle() }
                  .foregroundColor(.red)
              }
            }
        }
      .navigationTitle(mode == .new ? "New Project" : viewModel.project.title)
      .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
      .navigationBarItems(
        leading: cancelButton,
        trailing: saveButton
      )
      .actionSheet(isPresented: $presentActionSheet) {
        ActionSheet(title: Text("Are you sure?"),
                    buttons: [
                      .destructive(Text("Delete Project"),
                                   action: { self.handleDeleteTapped() }),
                      .cancel()
                    ])
      }
    }
  }
  
  // MARK: - Action Handlers
  
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
}

//struct BookEditView_Previews: PreviewProvider {
//  static var previews: some View {
//    let book = Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474)
//    let bookViewModel = BookViewModel(book: book)
//    return BookEditView(viewModel: bookViewModel, mode: .edit)
//  }
//}
