//
//  MainWindowController.swift
//  Lyse
//
//  Created by 石榴 on 3/21/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
	
	// MARK: - Local Vars
	
	var downloader = Downloader()
	
	override var windowNibName: String {
		return "MainWindowController"
	}
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override func windowDidLoad() {
        super.windowDidLoad()
		
		downloader.download()
    }
	// MARK: - Delegates

}
