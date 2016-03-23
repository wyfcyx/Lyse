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
	
	@IBOutlet weak var textField: NSTextField!
	
	// MARK: - IBActions
	
	@IBAction func pressButton(sender: AnyObject) {
		if let string = downloader.storage {
			textField.stringValue = string
		}
	}
	
	// MARK: - Functions
	
	override func windowDidLoad() {
        super.windowDidLoad()
		
		downloader.downloadHTMLSourceCode()
    }
	// MARK: - Delegates

}
