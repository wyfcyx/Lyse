//
//  AppDelegate.swift
//  Lyse
//
//  Created by wyfcyx on 16/3/21.
//  Copyright © 2016年 jz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	// MARK: - Local Vars
	
	var mainWindowController: MainWindowController?
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	// MARK: - Delegates
	
	// MARK: - > NSApplicationDelegate
	
	func applicationDidFinishLaunching(aNotification: NSNotification) {
		let mainWindowController = MainWindowController()
		
		mainWindowController.showWindow(self)
		
		self.mainWindowController = mainWindowController
	}
	
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

}

