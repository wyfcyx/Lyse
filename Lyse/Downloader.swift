//
//  Downloader.swift
//  Lyse
//
//  Created by 石榴 on 3/23/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Foundation
import Alamofire

let testHTMLURL = "http://utaten.com/lyric/NGT48/Maxとき315号/"
let testJSONURL = "http://vgmdb.info/search/123?format=json"

class Downloader {
	
	// MARK: - Local Vars
	
	var requestUrl: String? {
		didSet {
			if let string = requestUrl {
				requestUrl = string.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
			}
		}
	}
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	// MARK: - Delegates
	
}

class HTMLDownloader: Downloader {
	// MARK: - Local Vars
	
	var HTMLSourceCodeStorage: String? = ""
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override init() {
		super.init()
		
		requestUrl = testHTMLURL
	}
	
	func downloadHTMLSourceCode() -> Bool {
		var succeed = true
		Alamofire.request(.GET, requestUrl!)
			.responseString(encoding: NSUTF8StringEncoding) { response in
				switch response.result {
				case .Success(let sourceCode):
					self.HTMLSourceCodeStorage = sourceCode
				case .Failure(let error):
					print(error)
					succeed = false
				}
		}
		return succeed
	}
	
	// MARK: - Delegates
}

class JSONDownloader: Downloader {
	// MARK: - Local Vars
	
	var JSONCodeStorage: NSDictionary?
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override init() {
		super.init()
		
		requestUrl = testJSONURL
	}
	
	func downloadJSONCode() -> Bool {
		var succeed = true
		Alamofire.request(.GET, requestUrl!)
			.responseJSON { response in
				switch response.result {
				case .Success(let JSON):
					self.JSONCodeStorage = JSON as? NSDictionary
				case .Failure(let error):
					print(error)
					succeed = false
				}
		}
		return succeed
	}
	
	// MARK: - Delegates
}