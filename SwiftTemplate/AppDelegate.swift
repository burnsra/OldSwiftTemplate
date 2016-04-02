//
//  AppDelegate.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 4/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let launcherAppIdentifier = "\(Global.Bundle.idenitifier)Launcher"

        var launchAtLogin = false
        for app in NSWorkspace.sharedWorkspace().runningApplications {
            if app.bundleIdentifier == launcherAppIdentifier {
                launchAtLogin = true
            }
        }

        if launchAtLogin {
            NSDistributedNotificationCenter.defaultCenter().postNotificationName("killme", object: NSBundle.mainBundle().bundleIdentifier!)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

