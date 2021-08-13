
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
    @State private var isEmailValid : Bool   = true
    @State private var isSelected : Bool   = false
    
    // MARK: - State (Initialiser-modifiable)
    
    @ObservedObject var viewModel = ProjectViewModel2()
    @ObservedObject var usersVM = UsersViewModel()
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    @State private var newAssigned = ""
    @State private var isEditing = false
    @State var redSelected = false
    @State var blueSelected = false
    
    
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
       // .disabled(!viewModel.modified)
        .disabled(viewModel.project.title.isEmpty)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title *")) {
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
                        Spacer()
                        
                        VStack{
                            Button{
                                self.viewModel.project.color = Color.redButton
                                self.helpText = "Help Needed"
                                self.redSelected = true
                                self.blueSelected = false
                                viewModel.project.helpToggle = true
                                
                            }label: {
                              VStack{
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(redSelected ? Color.redButton : Color.redButton.opacity(0.3))
                                Text("Help \nNeeded")
                                    .foregroundColor(redSelected ? Color.accentColor : Color.accentColor.opacity(0.3))
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                            }
                            
                            .cornerRadius(10)
                                    
                            }
                            .buttonStyle(BorderlessButtonStyle())
    
                        }
                        
                        Spacer()
                        
                        VStack{
                            Button{
                                self.viewModel.project.color = Color.blueButton
                                self.helpText = "No Help Needed"
                                self.redSelected = false
                                self.blueSelected = true
                                viewModel.project.helpToggle = false
                                
                            }label: {
                                VStack{
                                    Circle()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(blueSelected ? Color.blueButton : Color.blueButton.opacity(0.3))
                                    Text("No Help \nNeeded")
                                        .foregroundColor(blueSelected ? Color.accentColor : Color.accentColor.opacity(0.3))
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                }
                                .cornerRadius(10)
                                
                                                                }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        Spacer()
                    }
                    .padding()
                }
                
               
                
//                Section(header: Text("Email of Officer Leading Project")){
//                    TextField("Enter Officer Email", text: $viewModel.project.officerEmail, onEditingChanged: { (isChanged) in
//                        if !isChanged {
//                            if self.textFieldValidatorEmail(self.viewModel.project.officerEmail) {
//                                self.isEmailValid = true
//                            } else {
//                                self.isEmailValid = false
//                                self.viewModel.project.officerEmail = ""
//                            }
//                        }
//                    })
//                    .autocapitalization(.none)
//
//                    if !self.isEmailValid {
//                        Text("Email is Not Valid")
//                            .font(.callout)
//                            .foregroundColor(Color.red)
//                    }
//                }
                
                Section(header: Text("Email of Officer Leading Project")){
                    //TextField("Enter Officer Email", text: $viewModel.project.officerEmail)
                    TextEditor(text: $viewModel.project.officerEmail)
                        .frame(height: 40, alignment: .center)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                
                Section(header: Text("Assign Members")) {
                    ForEach(viewModel.project.assignedStudents, id: \.self) { assignedStudent in
                        Text(assignedStudent)
                    }
                    .onDelete { indices in
                        viewModel.project.assignedStudents.remove(atOffsets: indices)
                    }

                    HStack {
                        TextField("Enter Name Here", text: $newAssigned)
                        Button(action: {
                            withAnimation {
                                viewModel.project.assignedStudents.append(newAssigned)
                                newAssigned = ""
                                self.isEditing = true
                            }

                        }) {
                            Image(systemName: "plus.circle.fill")
                                .accessibilityLabel(Text("Add new person"))
                        }
                        .disabled(newAssigned.isEmpty ? true : false)
                        .opacity(newAssigned.isEmpty ? 0.1 : 1.0)
                        

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
    
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
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
    
    
}



//struct BookEditView_Previews: PreviewProvider {
//  static var previews: some View {
//    let book = Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474)
//    let bookViewModel = BookViewModel(book: book)
//    return BookEditView(viewModel: bookViewModel, mode: .edit)
//  }
//}
