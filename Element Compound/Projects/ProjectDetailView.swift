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
    @ObservedObject var viewModels = ProjectViewModel2()
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
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 50){
                    Text("Created by: \(project.creator). Due: \(project.pickedDateString) at \(project.pickedTimeString). ")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .frame(width: 280)
                        .fixedSize()
                        .padding(.bottom, 50)
                    
                    Group{
                        HStack{
                    
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.red)
                            Spacer()
                            Text("Help Needed")
                                .font(.body)
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
                        largeButtonStyle(title: "Contact Moderator")
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
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

