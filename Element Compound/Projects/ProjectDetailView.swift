

////
////  BookDetailsView.swift
////  BookSpine
////
////  Created by Peter Friese on 15/09/2020.
////  Copyright © 2020 Google LLC. All rights reserved.
////
//
import SwiftUI




struct ProjectDetailsView: View {
  // MARK: - State

  @Environment(\.presentationMode) var presentationMode
  @State var presentEditBookSheet = false
    @ObservedObject var viewModel = ProjectViewModel2()
    @ObservedObject var viewModels = ProjectViewModel2()
    

    

  // MARK: - State (Initialiser-modifiable)

  var project: Project
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    @AppStorage ("role_Status") var role = Bool()


  // MARK: - UI Components

  private func editButton(action: @escaping () -> Void) -> some View {
    Button(action: { action() }) {
      Text("Edit")
    }
  }

  var body: some View {
      GeometryReader { geometry in
          ScrollView(.vertical) {
            
            HStack{
                Text(" \(project.creator), \(project.pickedDateString2)")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .frame(width: 280)
                    //.fixedSize()
                    .padding(.bottom, 50)
                    .padding(.leading, -65)
                
                Spacer()
            }
            
              VStack(spacing: 50){
               Group{
                      HStack{
                          Circle()
                              .frame(width: 35, height: 35)
                              .foregroundColor(project.color)
                          Spacer()
                          Text("Help Needed")
                         // Text(viewModel.project.helpNeeded ? "No Help Needed" : "Help Needed")
                         
                              //.font(.body)
                          Spacer()
                         
                      }
                      
                      HStack{
                          
                          Image(systemName: "info.circle.fill")
                              .font(.title)
                          Spacer()
                          LinkedText("\(project.notes)")
          //                    Text("Notes: \(project.notes)")
                              .font(.body)
                          Spacer()
                             
                      }
                      
                      HStack{
                          
                          Image(systemName: "person.3.fill")
                              .font(.title)
                          Spacer()
                          ForEach(project.assignedStudents, id: \.self) { assignedStudent in
                              Label(assignedStudent, systemImage: "person")
                                  .accessibilityLabel(Text("Person"))
                                  .accessibilityValue(Text(assignedStudent))
                                  .font(.body)
                          }
                          Spacer()
                      }
                      .padding(.bottom, 25)
                  }
                  
                  Button{
             
                  } label: {
                      mediumButtonStyle(title: "Contact Officer")
                  }
                  
                  Spacer()
              }
              .padding()
              .frame(width: geometry.size.width)
              .frame(minHeight: geometry.size.height)
          }
      }
   

    .navigationBarTitle(project.title)
    .navigationBarItems(trailing: editButton {
      self.presentEditBookSheet.toggle()
    })
    .onAppear() {
      print("BookDetailsView.onAppear() for \(self.project.title)")
    }
    .onDisappear() {
      print("BookDetailsView.onDisappear()")
    }
    .sheet(isPresented: self.$presentEditBookSheet) {
     ProjectEditView2(viewModel: ProjectViewModel2(project: project), mode: .edit) { result in
        if case .success(let action) = result, action == .delete {
          self.presentationMode.wrappedValue.dismiss()
        }
      }
    }
  }
}

