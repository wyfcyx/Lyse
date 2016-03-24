//
//  JZWindowController.swift
//  Lyse
//
//  Created by 石榴 on 3/24/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Cocoa

class JZWindowController: NSWindowController, NetworkDelegate {
	// MARK: - Local Vars
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override func windowDidLoad() {
		super.windowDidLoad()
		
		// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
	}
	
	// MARK: - Delegates
	
	// MARK: - > NetworkDelegate
	
	func downloadWillStart() {}
	
	func downloadDidFinish(isSucceeded: Bool, downloader: Downloader) {}

}
