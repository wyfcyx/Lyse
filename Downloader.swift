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
	
	var requestUrl: String?
	
	// MARK: - IBOutlets
	
	// MARK: - IBActions
	
	// MARK: - Functions
	
	init() {
		requestUrl = testUrl
	}
	
	func download() -> Bool {
		Alamofire.request(.GET, testUrl).responseJSON {
			response in
			print(response.request)
			print(response.response)
			//print(response.data)
			
			let string = String(data: response.data!, encoding: NSUTF8StringEncoding)
			
			print(string)
			
			if let JSON = response.result.value {
				//print("JSON: \(JSON)")
				
				let string = String(data: JSON as! NSData, encoding: NSUTF8StringEncoding)
				
				print(string)
				
			}
		}
		return true
	}
	
	// MARK: - Delegates
	
}