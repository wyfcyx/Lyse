//
//  Downloader.swift
//  Lyse
//
//  Created by 石榴 on 3/23/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Foundation
import Alamofire

class Downloader {
	
	// MARK: - Local Vars
	
	var requestUrl: String = ""
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	// MARK: - Delegates
	
}

class HTMLDownloader: Downloader {
	// MARK: - Local Vars
	
	let testURL = "http://utaten.com/lyric/RADIO+FISH/PERFECT+HUMAN/"
	
	var HTMLSourceCodeStorage: String? = ""
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	func downloadHTMLSourceCode() {
		Alamofire.request(.GET, testURL)
			.responseString(encoding: NSUTF8StringEncoding) { response in
				self.HTMLSourceCodeStorage = response.result.value
		}
	}
	
	// MARK: - Delegates
}

class JSONDownloader: Downloader {
	// MARK: - Local Vars
	
	let testURL = "http://vgmdb.info/search/123?format=json"
	
	var JSONCodeStorage: NSDictionary?
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	func downloadJSONCode() {
		Alamofire.request(.GET, testURL)
			.responseJSON { response in
				switch response.result {
				case .Success(let JSON):
					self.JSONCodeStorage = JSON as? NSDictionary
				case .Failure(let error):
					print(error)
				}
				
		}
	}
	
	// MARK: - Delegates
}