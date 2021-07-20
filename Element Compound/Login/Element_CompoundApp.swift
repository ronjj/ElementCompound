import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseMessaging
import UserNotifications
import FirebaseFunctions


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
            
            
          
           
            return true
        }
        
     
        
        func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
          Messaging.messaging().subscribe(toTopic: "announcements"){ error in
            print("Subscribed to announcements topic")
          }
        }
        
      
        
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
            return GIDSignIn.sharedInstance().handle(url)
            //
            
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


