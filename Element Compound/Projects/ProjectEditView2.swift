
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
    @State var helpText = ""

  // MARK: - State (Initialiser-modifiable)
  
  @ObservedObject var viewModel = ProjectViewModel2()
  var mode: Mode = .new
  var completionHandler: ((Result<Action, Error>) -> Void)?
  @State private var newAssigned = ""
   
  
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
  
  var body: some View {
    NavigationView {
      Form {
          Section(header: Text("Title")) {
              TextEditor(text:$viewModel.project.title)
                  .font(.custom("SF Pro", size: 18))
                  .frame(height: 125, alignment: .center)
                  .foregroundColor(.gray)
                  .multilineTextAlignment(.leading)
          }

          Section(header: Text("Due Date")) {
              DatePicker("Choose Due Date", selection: $viewModel.project.dueDate, displayedComponents: .date)
          }
          
          Section(header: Text("Select Status")) {
              
              //V1
             // ColorPicker("Choose Color", selection: $viewModel.project.color, supportsOpacity: false)
              
              //V2
//                Picker("Please choose a color", selection: $selectedColor) {
//                              ForEach(colors, id: \.self) { color in
//                                Circle()
//                                      .frame(width: 30, height: 30)
//                                      .foregroundColor(color)
//                              }
//
//                          }
             

            
              //V3
              HStack{
                  VStack{
                      Button{
                          self.viewModel.project.color = Color.redButton
                          self.helpText = "Help Needed"
                        viewModel.project.helpToggle = true
                         
                      }label: {
                          Circle()
                              .frame(width: 30, height: 30)
                            .foregroundColor(Color.redButton)
                      }
                      .buttonStyle(BorderlessButtonStyle())
                      
                      Text("Help Needed")
                  }

                  Spacer()

                  VStack{
                      Button{
                          self.viewModel.project.color = Color.blueButton
                          self.helpText = "No Help Needed"
                        viewModel.project.helpToggle = false
                         
                      }label: {
                          Circle()
                              .frame(width: 30, height: 30)
                              .foregroundColor(Color.blueButton)
                      }
                      .buttonStyle(BorderlessButtonStyle())

                      Text("No Help Needed")
                  }

              }
              
              .padding(20)
          }

       

          Section(header: Text("Assign Members")) {
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

        
        Section(header: Text("Percentage Complete")){
            HStack{
                Slider(value: $viewModel.project.percentComplete, in: 0...100)
                    .padding()
                
                Text("\(viewModel.project.percentComplete, specifier: "%.0f")%")
            }
           
        }
        
        
          Section(header: Text("Project Notes and Description")){
              TextEditor(text: $viewModel.project.notes)
                  .frame(height: 125, alignment: .center)
                  .foregroundColor(.gray)
                  .multilineTextAlignment(.leading)
          }
          
          Section(header: Text("Officer Email")){
              TextField("Enter Officer Email", text: $viewModel.project.officerEmail)
          }
          
          //              Priority Level
          //            Section(header: Text("Priority")) {
          //                Picker("Priority Level", selection: $viewModel.project.priority) {
          //                    ForEach(Self.priorityLevels, id: \.self) {
          //                        Text($0)
          //                    }
          //                }
          //                .pickerStyle(SegmentedPickerStyle())
          //
          //            }

                    //Completion Level
          //            Section(header: Text("Stage")) {
          //
          //                Picker("Completion Level", selection: $viewModel.project.completionLevel) {
          //                    ForEach(Self.completionLevels, id: \.self) {
          //                        Text($0)
          //                    }
          //                }
          //            }
        
        if mode == .edit {
          Section {
            Button("Delete Project") { self.presentActionSheet.toggle() }
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
