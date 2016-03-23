//
//  Downloader.swift
//  Lyse
//
//  Created by 石榴 on 3/23/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Foundation
import Alamofire

let testUrl = "http://utaten.com/lyric/RADIO+FISH/PERFECT+HUMAN/"

class Downloader{
	
	// MARK: - Local Vars
	
	var requestUrl: String = testUrl
	var storage: String? = ""
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	func downloadHTMLSourceCode() {
		Alamofire.request(.GET, requestUrl)
			.responseString(encoding: NSUTF8StringEncoding) { response in
				self.storage = response.result.value
		}
	}
	
	// MARK: - Delegates
	
}