//
//  AppDelegate.swift
//  StatusBarStudy
//
//  Created by Roy on 2023/10/15.
//

import Foundation
import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {

    // We need to declare NSStatusItem here, otherwise it gets destroyed after
    // applicationDidFinishLaunching is called
    var statusBarItem : NSStatusItem!
    var statusBarMenu : NSMenu!

    // Enable Quit Feature
    @objc func quit() {
        NSApplication.shared.terminate(self)
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {

        // Returns the system-wide status bar located in the menu bar.
        let statusBarView = AnyView(StatusBarView())

        // Returns a newly created status item that has been allotted a specified space within the status bar.
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))

                if let button = self.statusBarItem.button {
                    let view = NSHostingView(rootView: statusBarView)
                    view.setFrameSize(NSSize(width: 57, height: NSStatusBar.system.thickness))
                    
                    button.subviews.forEach { $0.removeFromSuperview() }
                    button.addSubview(view)
                    self.statusBarItem.length = 57
                }

        // An object that manages an app’s menus.
        self.statusBarMenu = NSMenu()
        self.statusBarMenu.addItem(withTitle: "Settings", action: #selector(openSettings), keyEquivalent: "")
        self.statusBarMenu.addItem(withTitle: "Quit", action: #selector(quit), keyEquivalent: "")

        // Add menu to statusbar
        self.statusBarItem.menu = self.statusBarMenu
    }
    
    // Trigger view of Settings Panel
    @objc func openSettings() {
        // Get focus from other apps
        NSApplication.shared.activate(ignoringOtherApps: true)

        // Create the frame to draw window
        let settings = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 640, height: 480),
            styleMask: [.titled, .closable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        // Add title
        settings.title = "Settings"

        // Keeps window reference active, we need to use this when using NSHostingView
        settings.isReleasedWhenClosed = false

        // Lets us use SwiftUI viws with AppKit
        settings.contentView = NSHostingView(rootView: SettingsView())

        // Center and bring forward
        settings.center()
        settings.makeKeyAndOrderFront(nil)
    }

}

