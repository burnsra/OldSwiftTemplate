//
//  PreferencesWindowController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 4/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

protocol PreferencesWindowControllerDelegate {
    func preferencesUpdated(sender: AnyObject?)
}

class PreferencesWindowController: NSWindowController, NSWindowDelegate {

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
    }

    func windowWillClose(notification: NSNotification) {
        NSLog("\(self.dynamicType) \t \(#function)")
        delegate?.preferencesUpdated(self)
    }

}
