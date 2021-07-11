//
//  FireChatApp.swift
//  FireChat
//
//  Created by Kushagra Sharma on 07/07/21.
//

import SwiftUI
import Firebase

@main
struct FireChatApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
