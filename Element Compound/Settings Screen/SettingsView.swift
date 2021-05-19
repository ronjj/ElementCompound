//
//  SettingsView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import MessageUI



enum Sheets: Identifiable {
    
    var id: Int {
        self.hashValue
    }
    
    case info
    case mail
    case role
    
}


struct SettingsView: View {
    
//    @State private var presentInfoScreen = false
//    @State private var presentRoleScreen = false
//    @State var isShowingMailView = false
    @State private var activeSheet: Sheets?
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var alertNoMail = false

    @AppStorage ("log_Status") var status = true
    @AppStorage ("role_Status") var role = Bool()
    
    
    let uidevice = UIDevice()
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Display Name (Based On Google)")){
                    Text("\(Auth.auth().currentUser?.displayName ?? "Not Logged In")")
                }
                
                Section(header: Text("Email")){
                    Text("\(Auth.auth().currentUser?.email ?? "Not Logged In")")
                }
                
                Section(header: Text("Version")){
                    Text("0.1.0")
                }
                
                
                //Buttons
                Section{
                    
                    //                        Button(action: {
                    //                           self.isShowingMailView.toggle()
                    //                        }) {
                    //                            Text("Contact The Developer")
                    //                        }
                    //                        .disabled(!MFMailComposeViewController.canSendMail())
                    //                        .sheet(isPresented: $isShowingMailView) {
                    //                                   MailView(result: self.$result)
                    //                               }
                    HStack {
                        Image(systemName: "envelope.circle").imageScale(.large)
                        Text("Contact Developer")
                        
                    
                        
                    }
                    .frame(height: 50)
                    .onTapGesture {
//                        MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                        if MFMailComposeViewController.canSendMail() {
//                            self.isShowingMailView.toggle()
                            activeSheet = .mail
                        } else if let emailUrl = SettingsView.createEmailUrl(subject: "Element Compound Feedback", body: "\n\n\n\n\n——————————————\nDevice: \(UIDevice.modelName) (\(uidevice.model))\niOS Version: \(uidevice.systemVersion)\nApp Version: \(String(describing: UIDevice.version))") {
                            UIApplication.shared.open(emailUrl)
                        } else {
                            self.alertNoMail.toggle()
                            

                            
                        }
                    }
                    .sheet(item: $activeSheet) { item in
                        switch item {
                        case .info:
                            InfoScreen()
                        case .mail:
                            MailView(result: self.$result)
                        case .role:
                            RoleCodeScreen()
                        }
                    }
//                    .alert(item: self.$alertNoMail) {
//                               Alert(title: Text("No Mail Application Found"), message: Text("Mail Application Not Found \n Developer's email is \n ronaldjabouin2004@gmail.com"), dismissButton: .cancel())
//                           }
                    .alert(isPresented: self.$alertNoMail) {
                        Alert(title: Text("No Mail Application Found"), message: Text("Mail Application Not Found \n Developer's email is \n ronaldjabouin2004@gmail.com"), dismissButton: .cancel())
                    }
                    
                    Button(action: {
                        signOut()
                        self.status = false
                    }) {
                        Text("Sign Out")
                    }
                    
                    Button(action: {
//                        self.presentRoleScreen = true
                        activeSheet = .role
                    }) {
                        Text("Get Role")
                    }
                }
                
            }
           
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Settings")

            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
//                        presentInfoScreen = true
                        activeSheet = .info
                        
                    }) {
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
        
        
    }
    static func createEmailUrl(subject: String, body: String) -> URL? {
            let to = "ronaldjabouin2004@gmail.com"
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


func signOut(){
    let firebaseAuth = Auth.auth()
    do {
        try firebaseAuth.signOut()
    } catch let signOutError as NSError {
        print ("Error signing out: %@", signOutError)
    }
    
    
    //    func logOut() {
    //
    //        GIDSignIn.sharedInstance()?.signOut()
    //        try! Auth.auth().signOut()
    //
    //    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
    
}

extension UIDevice {
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPod9,1":                                 return "iPod Touch 7"
                
                
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":         return "iPhone 4"
            case "iPhone4,1":                                   return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                      return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                      return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                      return "iPhone 5s"
            case "iPhone7,2":                                   return "iPhone 6"
            case "iPhone7,1":                                   return "iPhone 6 Plus"
            case "iPhone8,1":                                   return "iPhone 6s"
            case "iPhone8,2":                                   return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                      return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                      return "iPhone 7 Plus"
            case "iPhone8,4":                                   return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                    return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                    return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                    return "iPhone X"
            case "iPhone11,2", "iPhone11,4", "iPhone11,6":      return "iPhone XS"
            case"iPhone11,8":                                   return "iPhone XR"
            case"iPhone12,1":                                   return "iPhone 11"
            case"iPhone12,3":                                   return "iPhone 11 Pro"
            case"iPhone12,5":                                   return "iPhone 11 Pro Max"
            case"iPhone12,8":                                   return "iPhone SE 2nd Gen"
            case"iPhone13,1":                                   return "iPhone 12 Mini"
            case"iPhone13,2":                                   return "iPhone 12"
            case"iPhone13,3":                                   return "iPhone 12 Pro"
            case"iPhone13,4":                                   return "iPhone 12 Pro Max"
                    
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":    return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":               return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":               return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":               return "iPad Air"
            case "iPad5,3", "iPad5,4":                          return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                        return "iPad 5"
            case "iPad7,5", "iPad7,6":                          return "iPad 6"
            case "iPad7,11", "iPad7,12" :                       return "iPad 7"
            case "iPad2,5", "iPad2,6", "iPad2,7":               return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":               return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":               return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                          return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                          return "iPad Pro 9.7 Inch"
            case "iPad6,7", "iPad6,8":                          return "iPad Pro 12.9 Inch"
            case "iPad7,1", "iPad7,2":                          return "iPad Pro 12.9 Inch 2. Generation"
            case "iPad7,3", "iPad7,4":                          return "iPad Pro 10.5 Inch"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":    return "iPad Pro 11 inch 3rd Gen"
     
  
                
              

            
//                iPad8,5 : iPad Pro 12.9 inch 3rd Gen (WiFi)
//                iPad8,6 : iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)
//                iPad8,7 : iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)
//                iPad8,8 : iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)
//                iPad8,9 : iPad Pro 11 inch 4th Gen (WiFi)
//                iPad8,10 : iPad Pro 11 inch 4th Gen (WiFi+Cellular)
//                iPad8,11 : iPad Pro 12.9 inch 4th Gen (WiFi)
//                iPad8,12 : iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)
//                iPad11,1 : iPad mini 5th Gen (WiFi)
//                iPad11,2 : iPad mini 5th Gen
//                iPad11,3 : iPad Air 3rd Gen (WiFi)
//                iPad11,4 : iPad Air 3rd Gen
//                iPad11,6 : iPad 8th Gen (WiFi)
//                iPad11,7 : iPad 8th Gen (WiFi+Cellular)
//                iPad13,1 : iPad air 4th Gen (WiFi)
//                iPad13,2 : iPad air 4th Gen (WiFi+Cellular)
//                iPad13,4 : iPad Pro 11 inch 3rd Gen
//                iPad13,5 : iPad Pro 11 inch 3rd Gen
//                iPad13,6 : iPad Pro 11 inch 3rd Gen
//                iPad13,7 : iPad Pro 11 inch 3rd Gen
//                iPad13,8 : iPad Pro 12.9 inch 5th Gen
//                iPad13,9 : iPad Pro 12.9 inch 5th Gen
//                iPad13,10 : iPad Pro 12.9 inch 5th Gen
//                iPad13,11 : iPad Pro 12.9 inch 5th Gen
                
                
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
}
