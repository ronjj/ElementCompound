//
//  LoginView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/17/21.
//



import SwiftUI
import GoogleSignIn


struct LoginView: View {
    var body: some View {
        
        google().frame(width: 120, height: 50)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct google : UIViewRepresentable {
    

    func makeUIView(context: UIViewRepresentableContext<google>) -> GIDSignInButton {
        
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<google>) {
        
    }
}
