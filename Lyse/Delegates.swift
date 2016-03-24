//
//  Delegates.swift
//  Lyse
//
//  Created by 石榴 on 3/24/16.
//  Copyright © 2016 jz. All rights reserved.
//

import Foundation

protocol NetworkDelegate {

	func downloadWillStart()
	func downloadDidFinish(isSucceeded: Bool, downloader: Downloader)

}