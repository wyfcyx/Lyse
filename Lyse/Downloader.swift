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
	
	var delegate: NetworkDelegate?
	var storage: AnyObject?
	
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
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override init() {
		super.init()
		
		requestUrl = ""
	}
	
	func downloadHTMLSourceCode(sender: JZWindowController?) {
		var succeed = true
		var willDelegate = false
		if let original = sender {
			delegate = original
			delegate!.downloadWillStart()
			willDelegate = true
		}
		Alamofire.request(.GET, requestUrl!)
			.responseString(encoding: NSUTF8StringEncoding) { response in
				switch response.result {
				case .Success(let sourceCode):
					self.storage = sourceCode
				case .Failure(let error):
					print(error)
					succeed = false
				}
				if willDelegate {
					self.delegate!.downloadDidFinish(succeed, downloader: self)
				}
		}
	}
	
	// MARK: - Delegates
}

class JSONDownloader: Downloader {
	// MARK: - Local Vars
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	override init() {
		super.init()
		
		requestUrl = testJSONURL
	}
	
	func downloadJSONCode(sender: JZWindowController?) {
		var succeed = true
		var willDelegate = false
		if let original = sender {
			delegate = original
			delegate!.downloadWillStart()
			willDelegate = true
		}
		Alamofire.request(.GET, requestUrl!)
			.responseJSON { response in
				switch response.result {
				case .Success(_):
					self.storage = response.result.value
				case .Failure(let error):
					print(error)
					succeed = false
				}
				if willDelegate {
					self.delegate?.downloadDidFinish(succeed, downloader: self)
				}
		}
	}
	
	// MARK: - Delegates
}