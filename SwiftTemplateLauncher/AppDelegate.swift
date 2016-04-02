//
//  AppDelegate.swift
//  SwiftTemplateLauncher
//
//  Created by Robert Burns on 4/2/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let bundleIdenitifier: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier") as! String
    let bundleName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let mainAppIdentifier = bundleIdenitifier.stringByReplacingOccurrencesOfString("Launcher", withString: "")
        let running           = NSWorkspace.sharedWorkspace().runningApplications
        var alreadyRunning    = false

        for app in running {
            if app.bundleIdentifier == mainAppIdentifier {
                alreadyRunning = true
                break
            }
        }

        if !alreadyRunning {
            NSDistributedNotificationCenter.defaultCenter().addObserver(self, selector: "terminate", name: "killme", object: mainAppIdentifier)

            let path = NSBundle.mainBundle().bundlePath as NSString
            var components = path.pathComponents
            components.removeLast()
            components.removeLast()
            components.removeLast()
            components.append("MacOS")
            components.append(bundleName.stringByReplacingOccurrencesOfString("Launcher", withString: ""))

            let newPath = NSString.pathWithComponents(components)

            NSWorkspace.sharedWorkspace().launchApplication(newPath)
        }
        else {
            NSApplication.sharedApplication().terminate(nil)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func terminate() {
        NSLog("\(self.dynamicType) \t \(#function)")
        NSApplication.sharedApplication().terminate(nil)
    }


}

