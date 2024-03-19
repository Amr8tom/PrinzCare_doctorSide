import UIKit
import Flutter
import Firebase
import GoogleMaps  // Add this import
import flutter_local_notifications




@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
               GeneratedPluginRegistrant.register(with: registry)
    }

    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("---------- Google Map Api Key ----------")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
