//
//  GringottsBankApp.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import SwiftUI

@main
struct GringottsBankApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings { // This is not a desktop app with actual window, so making this class Settings
            ContentView()
        }
    }
}
