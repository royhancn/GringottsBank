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
        Settings { // Dont forget to change this line to Settings
            ContentView()
        }
    }
}
