//
//  Downloader.swift
//  Lyse
//
//  Created by 石榴 on 3/23/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Foundation
import Alamofire

var testUrl = "http://utaten.com/lyric/RADIO+FISH/PERFECT+HUMAN/"

class Downloader{
	
	// MARK: - Local Vars
	
	var requestUrl: String?
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	init() {
		requestUrl = testUrl
	}
	
	func download() -> Bool {
		Alamofire.request(.GET, requestUrl!).responseJSON() {
			(data) in
			print(data)
		}
		
		return true
	}
	
	// MARK: - Delegates
	
}