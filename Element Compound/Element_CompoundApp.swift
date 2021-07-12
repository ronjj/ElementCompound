//
//  Element_CompoundApp.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 3/27/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import UserNotifications


@main
struct Element_CompoundApp: App {
    @AppStorage ("log_Status") var status = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var
        delegate
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
      
    }
    
    //    class ViewController: UIViewController {
    //        override func viewDidLoad() {
    //            super.viewDidLoad()
    //            overrideUserInterfaceStyle = .light
    //        }
    //    }
    
    
    //@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate, MessagingDelegate, UNUserNotificationCenterDelegate{

        
        
        @AppStorage ("log_Status") var status = false
        @ObservedObject private var viewModel = AnnouncementsViewModel()
        let gcmMessageIDKey = "gcm.message_id"
        let user = Auth.auth().currentUser
        
        
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
            GIDSignIn.sharedInstance().delegate = self
            
            
            //MARK: Start of Notifs
            
            Messaging.messaging().delegate = self
            
            if #available(iOS 10.0, *) {
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.current().delegate = self
                
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: { _, _ in }
                )
            } else {
                let settings: UIUserNotificationSettings =
                    UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
            
            application.registerForRemoteNotifications()
            
            
            
            return true
        }
        
        func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            if  let messageID = userInfo[gcmMessageIDKey] {
                print ("message id: \(messageID)")
            }
            print(userInfo)
            
            completionHandler(UIBackgroundFetchResult.newData)
        }
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
            return GIDSignIn.sharedInstance().handle(url)
            //
            
        }
        func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
            let deviceToken: [String: String] = ["token": fcmToken ]
            
            print("Device token" , deviceToken)
        }
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
            // ...
            if let error = error {
                // ...
                print(error.localizedDescription)
                return
            }
            
            // Perform any operations on signed in user here.
            
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (res, err) in
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                } else {
                    print("user=" + (res?.user.email)!)
                    withAnimation(.easeInOut) {
                        self.status = true
                        
                        //put logic here for if else
                    }
                }
            }
        }
        
        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            // Perform any operations when the user disconnects from app here.
            // ...
        }
        
        
        // MARK: UISceneSession Lifecycle
        
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            // Called when a new scene session is being created.
            // Use this method to select a configuration to create the new scene with.
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        }
        
        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
            // Called when the user discards a scene session.
            // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
            // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        }
        
        func signOut(){
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }
}









