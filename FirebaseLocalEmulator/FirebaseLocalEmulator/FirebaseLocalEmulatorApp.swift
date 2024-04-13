//
//  FirebaseLocalEmulatorApp.swift
//  FirebaseLocalEmulator
//
//  Created by Mayank Choudhary on 13/04/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      let settings = Firestore.firestore().settings
      settings.host = "127.0.0.1:8080"
      settings.cacheSettings = MemoryCacheSettings()
      settings.isSSLEnabled = false
      Firestore.firestore().settings = settings
      
    Auth.auth().useEmulator(withHost: "localhost", port: 9099)
      
    return true
  }
}

@main
struct FirebaseLocalEmulatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
