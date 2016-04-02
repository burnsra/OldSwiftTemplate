//
//  StatusMenuController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 4/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject, PreferencesWindowControllerDelegate {

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    var preferencesWindowController: PreferencesWindowController!

    override func awakeFromNib() {
        var item_about: NSMenuItem
        var item_documentation: NSMenuItem
        var item_preferences: NSMenuItem
        var item_quit: NSMenuItem

        let menu = NSMenu()
        let icon = NSImage(named: NSImageNameIconViewTemplate)
        icon?.template = true

        statusItem.image = icon
        statusItem.menu = menu
        statusItem.toolTip = "\(Global.Bundle.name) \(Global.Bundle.version)"

        item_about = NSMenuItem()
        item_about.action = #selector(self.clickAbout(_:))
        item_about.tag = Global.Menu.about
        item_about.target = self
        item_about.title = NSLocalizedString("menu_about", comment: "")

        item_documentation = NSMenuItem()
        item_documentation.action = #selector(self.clickDocumentation(_:))
        item_documentation.tag = Global.Menu.documentation
        item_documentation.target = self
        item_documentation.title = NSLocalizedString("menu_documentation", comment: "")

        item_preferences = NSMenuItem()
        item_preferences.action = #selector(self.clickPreferences(_:))
        item_preferences.tag = Global.Menu.preferences
        item_preferences.target = self
        item_preferences.title = NSLocalizedString("menu_preferences", comment: "")

        item_quit = NSMenuItem()
        item_quit.action = #selector(self.clickQuit(_:))
        item_quit.tag = Global.Menu.quit
        item_quit.target = self
        item_quit.title = NSLocalizedString("menu_quit", comment: "")

        menu.addItem(item_preferences)
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(item_about)
        menu.addItem(item_documentation)
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(item_quit)

        preferencesWindowController = PreferencesWindowController()
        preferencesWindowController.delegate = self

    }

    @IBAction func clickAbout(sender: NSMenuItem) {
        NSLog("\(self.dynamicType) \t \(#function)")
        NSApplication.sharedApplication().orderFrontStandardAboutPanel(sender)
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }

    @IBAction func clickDocumentation(sender: NSMenuItem) {
        NSLog("\(self.dynamicType) \t \(#function)")
        if let url: NSURL = NSURL(string: "\(Global.documentation_url)") {
            NSWorkspace.sharedWorkspace().openURL(url)
        }
    }

    @IBAction func clickPreferences(sender: NSMenuItem) {
        NSLog("\(self.dynamicType) \t \(#function)")
        preferencesWindowController.showWindow(nil)
    }

    @IBAction func clickQuit(sender: NSMenuItem) {
        NSLog("\(self.dynamicType) \t \(#function)")
        NSApplication.sharedApplication().terminate(sender)
    }

    func preferencesUpdated(sender: AnyObject?) {
        NSLog("\(self.dynamicType) \t \(#function)")
    }


}
