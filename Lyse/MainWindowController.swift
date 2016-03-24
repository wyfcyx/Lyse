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
	
	override var windowNibName: String {
		return "MainWindowController"
	}
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions

	
	// MARK: - Functions
	
	override func windowDidLoad() {
        super.windowDidLoad()
        let downloader = HTMLDownloader()
        downloader.downloadHTMLSourceCode()
        
        
        
        //let htmlSourceCode = downloader.HTMLSourceCodeStorage!
        let htmlSourceCode = "<div class=\"lyricBody\">\n  <div class=\"medium\">\n    <span class=\"ruby\"><span class=\"rb\">彼</span><span class=\"rt\">かれ</span></span>は<span class=\"ruby\"><span class=\"rb\">言</span><span class=\"rt\">い</span></span>った<span class=\"ruby\"><span class=\"rb\">世界</span><span class=\"rt\">せかい</span></span>は<span class=\"ruby\"><span class=\"rb\">必</span><span class=\"rt\">かなら</span></span>ずしもみんな<span class=\"ruby\"><span class=\"rb\">平等</span><span class=\"rt\">びょうどう</span></span>とは<span class=\"ruby\"><span class=\"rb\">限</span><span class=\"rt\">かぎ</span></span>らない<br />\n        <br />\n    na ka ta nakata ×3<br />\n    「I’m a perfect human」<br />\n    <br />\n    <span class=\"ruby\"><span class=\"rb\">大地</span><span class=\"rt\">だいち</span></span>パッカーン<span class=\"ruby\"><span class=\"rb\">海</span><span class=\"rt\">うみ</span></span>もパッカーン<br />\n    <br />\n   </div>\n</div>\n<div class>"
        let lyricFetcher = UtatenFetcher()
        let lyric = lyricFetcher.getLyric(htmlSourceCode)
        lyric.output()
    }
	// MARK: - Delegates

}
