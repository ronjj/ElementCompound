//
//  Home.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/16/21.
//

import SwiftUI

import Firebase
import GoogleSignIn

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome to")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                Text("Our Tutorial App")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
            }
            
            WrappedViewController()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct WrappedViewController: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> LoginViewController {
        let vc =  LoginViewController()
        print("\nmakeUIViewController \(vc)")
        return vc
    }

    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        print("updateUIViewController \(uiViewController)")
    }

    static func dismantleUIViewController(_ uiViewController: LoginViewController, coordinator: Self.Coordinator) {
        print("dismantleUIViewController \(uiViewController)")
    }
}

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        
        //Setting up the values necessary for the placement of the button
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height

        //Setting the size of the button
        let height: CGFloat = 40.0
        let width: CGFloat  = 260.0

        //Creating the button in a way that the placement (x,y) values of the button are relative in size to the screen.
        let button = UIButton(frame: CGRect(x: (screenWidth / 2.0) - (width / 2.2),
                                            y: (screenHeight / 1.4) - (height / 2.0),
                                            width: width,
                                            height: height))

        //Adding the Google Icon to the button
        let googleIcon = UIImage(named: "icons8-google-24")!
        button.leftImage(image: googleIcon, renderMode: .alwaysOriginal)

        //Adding text to the button
        button.backgroundColor = .white
        button.setTitle("Sign in with Google", for: .normal)
        //button.titleLabel?.textColor = .darkGray
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.cornerRadius = 20
        
        
        //Adding Shadow to the Google Button
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 00.5
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)
    }

    @objc func buttonAction(sender: UIButton!) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
}

/*
 This is additional code to make the Google Text and the Google Icon appear more inline with each other. Taken from Stack Overflow.
 */
extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
    }

    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
}
