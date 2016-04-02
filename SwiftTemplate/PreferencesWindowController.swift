//
//  PreferencesWindowController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 4/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa
import ServiceManagement

protocol PreferencesWindowControllerDelegate {
    func preferencesUpdated(sender: AnyObject?)
}

class PreferencesWindowController: NSWindowController, NSWindowDelegate {

    @IBOutlet weak var launchAtLoginButton: NSButton!

    var delegate: PreferencesWindowControllerDelegate?

    override var windowNibName : String! {
        return "\(self.dynamicType)"
    }

    override func showWindow(sender: AnyObject?) {
        NSLog("\(self.dynamicType) \t \(#function)")
        super.showWindow(sender)
        self.window?.center()
        self.window?.orderFront(self)
        self.window?.title = "\(NSLocalizedString("window_preferences_title", comment: ""))"
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        let userDefaults = NSUserDefaults.standardUserDefaults()

        switch userDefaults.boolForKey("launchAtLogin") {
        case true:
            launchAtLoginButton.state = 1
        case false:
            launchAtLoginButton.state = 0
        }
    }

    func windowWillClose(notification: NSNotification) {
        NSLog("\(self.dynamicType) \t \(#function)")
        delegate?.preferencesUpdated(self)
    }

    @IBAction func launchAtLoginClicked(sender: NSButton) {
        NSLog("\(self.dynamicType) \t \(#function)")

        let identifier = "\(Global.Bundle.idenitifier)Launcher"
        let userDefaults = NSUserDefaults.standardUserDefaults()

        switch sender.state {
        case 1:
            userDefaults.setBool(true, forKey: "launchAtLogin")
            SMLoginItemSetEnabled(identifier, true)
        case 0:
            userDefaults.setBool(false, forKey: "launchAtLogin")
            SMLoginItemSetEnabled(identifier, false)
        default:
            userDefaults.setBool(false, forKey: "launchAtLogin")
            SMLoginItemSetEnabled(identifier, false)
        }
    }
}
