//
//  FireChatApp.swift
//  FireChat
//
//  Created by Kushagra Sharma on 07/07/21.
//

import SwiftUI
import Firebase
import IQKeyboardManager

@main
struct FireChatApp: App {
    init () {
        FirebaseApp.configure()
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
