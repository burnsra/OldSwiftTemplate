//
//  Global.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 4/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Foundation

struct Global {

    struct Bundle {
        static let name: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
        static let version: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
        static let build: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as! String
        static let idenitifier: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier") as! String
    }

}