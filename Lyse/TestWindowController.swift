//
//  TestWindowController.swift
//  Lyse
//
//  Created by 石榴 on 3/24/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Cocoa

class TestWindowController: JZWindowController {
	// MARK: - Local Vars
	
	var downloader = HTMLDownloader()
	
	override var windowNibName: String? {
		return "TestWindowController"
	}
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override func windowDidLoad() {
		super.windowDidLoad()
		
		// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
		
		downloader.requestUrl = "http://utaten.com/lyric/NGT48/Maxとき315号/"
		downloader.downloadHTMLSourceCode(self)

	}
	
	// MARK: - Delegates
	
	// MARK: - > NetworkDelegate
	
	override func downloadWillStart() {
		return
	}
	
	override func downloadDidFinish(isSucceeded: Bool, downloader: Downloader) {
		
		let lyricString = downloader.storage as! String
		
		let lyricFetcher = UtatenFetcher()
		let lyric = lyricFetcher.getLyric(lyricString)
		lyric.output()
	}
	

    
}
