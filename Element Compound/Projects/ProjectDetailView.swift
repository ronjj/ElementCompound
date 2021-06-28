//
//  ProjectDetailView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/15/21.
//

import SwiftUI

struct ProjectDetailView: View {
    
    
    // MARK: - State
    
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditProjectSheet = false
    
    // MARK: - State (Initialiser-modifiable)
    
    var project: Project
    @ObservedObject var viewModel = ProjectViewModel2()
  //  @ObservedObject var favorites = Favorites()
    
    // MARK: - UI Components
    
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit")
      }
      //.disabled(role == false)
      .disabled(true)
    }
    
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    @AppStorage ("role_Status") var role = Bool()


    var body: some View {
        
        VStack{
            
            Text("Created by: \(project.creator). Due: \(project.pickedDateString) at \(project.pickedTimeString). ")
                .font(.body)
                .foregroundColor(Color.gray)
            
            Spacer()
            
            HStack{
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.red)
                Text("Help Needed")
                    .font(.body)
            }
            
            Spacer()
            
            HStack{
                Image(systemName: "info.circle.fill")
                    .font(.title)
                LinkedText("\(project.notes)")
//                    Text("Notes: \(project.notes)")
                    .font(.body)
            }
            
            Spacer()
            
            HStack{
                Image(systemName: "person.3.fill")
                    .font(.title)
                ForEach(project.assignedStudents, id: \.self) { assignedStudent in
                    Label(assignedStudent, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(assignedStudent))
                        .font(.body)
                }
            }
            
            Spacer()
            
            Button{
       
            } label: {
                ButtonStyle(title: "Contact Moderator")
            }
        }

            
        
        
        
            .navigationBarTitle(project.title)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        self.presentEditProjectSheet.toggle()
                    } label: {
                        Text("Edit")
                    }
                    .disabled(true)
                    
//                    Button{
//                        if self.favorites.contains(self.project) {
//                            self.favorites.remove(self.project)
//                        } else{
//                            self.favorites.add(self.project)
//                        }
//                    } label: {
//                        Image(systemName: self.favorites.contains(project) ? "heart.fill" : "heart")
//                            .foregroundColor(.red)
//                    }
                    
                   
                }
            }
            .onAppear() {
              print("BookDetailsView.onAppear() for \(self.project.title)")
            }
//            .onDisappear() {
//              print("BookDetailsView.onDisappear()")
//            }
            .sheet(isPresented: self.$presentEditProjectSheet) {
              ProjectEditView2(viewModel: ProjectViewModel2(project: project), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                  self.presentationMode.wrappedValue.dismiss()
                }
              }
            }
    }
}


