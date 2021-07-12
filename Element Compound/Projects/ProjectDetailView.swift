

////
////  BookDetailsView.swift
////  BookSpine
////
////  Created by Peter Friese on 15/09/2020.
////  Copyright © 2020 Google LLC. All rights reserved.
////
//
import SwiftUI
import UIKit
import MessageUI


enum Sheets4: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    
    case edit
    case mail

    
}


struct ProjectDetailsView: View {
  // MARK: - State

  @Environment(\.presentationMode) var presentationMode
  @State var presentEditBookSheet = false
    @ObservedObject var viewModel = ProjectViewModel2()
    @ObservedObject var viewModels = ProjectViewModel2()
    let uidevice = UIDevice()

  // MARK: - State (Initialiser-modifiable)

  var project: Project
    let colors = [Color.yellow2,Color.ruby, Color.nyanza ]
    @AppStorage ("role_Status") var role = Bool()
    @State private var activeSheet: Sheets4?
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var alertNoMail = false


  // MARK: - UI Components

  private func editButton(action: @escaping () -> Void) -> some View {
    Button(action: { action() }) {
      Text("Edit")
    }
    .disabled(role == false)
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
                    .padding(.leading, -40)
                
                Spacer()
            }
            
              VStack(spacing: 50){
               Group{
                      HStack{
                          Circle()
                              .frame(width: 35, height: 35)
                              .foregroundColor(project.color)
                          Spacer()
                        Text(project.helpToggle ? "Help Needed" : "No Help Needed")
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
                              .padding(15)
                          Spacer()
                             
                      }
                      
                      HStack{
                          Image(systemName: "person.3.fill")
                              .font(.title)
                          
                          Spacer()
                          
                          VStack(alignment: .leading, spacing: 10){
                              ForEach(project.assignedStudents, id: \.self) { assignedStudent in
                                      Label(assignedStudent, systemImage: "person")
                                          .accessibilityLabel(Text("Person"))
                                          .accessibilityValue(Text(assignedStudent))
                                          .font(.body)
                                  
                              }
                          }
                          Spacer()
                      }
                      .padding(.bottom, 25)
                   
                        ProgressBar(width: 300, height: 30, percent: project.percentComplete, color1: Color.red, color2: Color.blue)
                     
                  }
                  
                  Button{
                    if MFMailComposeViewController.canSendMail() {
//                            self.isShowingMailView.toggle()
                        activeSheet = .mail
                    } else if let emailUrl = ProjectDetailsView.createEmailUrl(to: "\(project.officerEmail)"  ,subject: "Officer Message", body: "\n\n\n\n\n——————————————\nDevice: \(UIDevice.modelName) (\(uidevice.model))\niOS Version: \(uidevice.systemVersion)\nApp Version: \(String(describing: UIDevice.version))") {
                        UIApplication.shared.open(emailUrl)
                    } else {
                        self.alertNoMail.toggle()
                        

                        
                    }
                  } label: {
                      mediumButtonStyle(title: "Contact Officer")
                  }

                  .alert(isPresented: self.$alertNoMail) {
                      Alert(title: Text("No Mail Application Found"), message: Text("Mail Application Not Found \n Officers's email is \n \(project.officerEmail)"), dismissButton: .cancel())
                  }
                 
                  
                  Spacer()
              }
              .padding()
              .frame(width: geometry.size.width)
              .frame(minHeight: geometry.size.height)
          }
      }
   

    .navigationBarTitle(project.title)
    .navigationViewStyle(StackNavigationViewStyle())
    .navigationBarItems(trailing: editButton {
      self.presentEditBookSheet.toggle()
        activeSheet = .edit
    })
    .onAppear() {
      print("BookDetailsView.onAppear() for \(self.project.title)")
    }
    .onDisappear() {
      print("BookDetailsView.onDisappear()")
    }
     
    
//    .sheet(isPresented: self.$presentEditBookSheet) {
//     ProjectEditView2(viewModel: ProjectViewModel2(project: project), mode: .edit) { result in
//        if case .success(let action) = result, action == .delete {
//          self.presentationMode.wrappedValue.dismiss()
//        }
//      }
//    }
    
      .sheet(item: $activeSheet) { item in
          switch item {
          case .mail:
              MailView2(result: self.$result)
          case .edit:
            ProjectEditView2(viewModel: ProjectViewModel2(project: project), mode: .edit) { result in
               if case .success(let action) = result, action == .delete {
                 self.presentationMode.wrappedValue.dismiss()
               }
             }

          }
      }
    
    
  }
    static func createEmailUrl(to: String, subject: String, body: String) -> URL? {
           // let to = "22420rj@chaminade-hs.org"
        // let to = ("\project.officerEmail)")
            let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

            let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
            let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

            if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
                return gmailUrl
            } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
                return outlookUrl
            } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
                return yahooMail
            } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
                return sparkUrl
            }

            return defaultUrl
        }
}

