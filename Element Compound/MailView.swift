//
//  MailView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 5/7/21.
//


import AVFoundation
import Foundation
import MessageUI
import SwiftUI
import UIKit

struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    var recipients = [String]()
    var messageBody = ""
    let uidevice = UIDevice()
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>)
        {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?)
        {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
            
            if result == .sent {
            AudioServicesPlayAlertSound(SystemSoundID(1001))
//            let alert = UIAlertController(title: "Thank You", message: "Your feedback has been sent.", preferredStyle: .alert)
//                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                            alert.addAction(okAction)
//                            self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        let mailto = "ronaldjabouin2004@gmail.com"
        vc.setToRecipients([mailto])
        vc.setSubject("Element Compound Bug Report / Feature Request")
       // vc.setMessageBody(messageBody, isHTML: false)
       // vc.setMessageBody("\n\n\n\n\n——————————————\nDevice: \(uidevice.modelName) (\(uidevice.model))\niOS Version: \(uidevice.systemVersion)\nApp Version: \(String(describing: uidevice.version))", isHTML: false)
        vc.setMessageBody( "\n\n\n\n\n——————————————\nDevice: \(UIDevice.modelName) (\(uidevice.model))\niOS Version: \(uidevice.systemVersion)\nApp Version: \(String(describing: UIDevice.version))", isHTML: false)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_: MFMailComposeViewController,
                                context _: UIViewControllerRepresentableContext<MailView>) {}
    
    
}
