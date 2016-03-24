//
//  VGMdbViewController.swift
//  
//
//  Created by 石榴 on 3/24/16.
//
//

import Cocoa
import SwiftyJSON

let VGMdbPrefix = "http://vgmdb.info"

class VGMdbViewController: JZWindowController, NSTableViewDataSource, NSTableViewDelegate {
	// MARK: - Local Vars
	
	override var windowNibName: String? {
		return "VGMdbViewController"
	}
	
	var JSONData: JSON?
	
	var currentLanguage: Int = 0 {
		didSet {
			if let view = tableView {
				view.reloadData()
			}
		}
	}
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var searchField: NSTextField!
	@IBOutlet weak var searchButton: NSButton!
	@IBOutlet weak var progressIndicator: NSProgressIndicator!
	@IBOutlet weak var languageSelector: NSPopUpButton!
	@IBOutlet weak var tableView: NSTableView!
	
	// MARK: - IBActions
	
	@IBAction func pressSearchButton(sender: AnyObject) {
		if searchField.stringValue.isEmpty || searchField.stringValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 3 {
			let alert: NSAlert = NSAlert()
			
			alert.addButtonWithTitle("OK")
			alert.messageText = "Not enough keywords"
			alert.informativeText = "Please enter at lease three characters."
			
			alert.runModal()
			return
		}
		
		let downloader = JSONDownloader()
		downloader.requestUrl = VGMdbPrefix + "/search/" + searchField.stringValue + "?format=json"
		downloader.downloadJSONCode(self)
	}
	// MARK: - Functions
	override func windowDidLoad() {
        super.windowDidLoad()
	}

	// MARK: - Delegates
	
	// MARK: - > NetworkDelegate
	
	override func downloadWillStart() {
		progressIndicator.hidden = false
		progressIndicator.startAnimation(nil)
		searchButton.enabled = false
		languageSelector.enabled = false
	}
	
	override func downloadDidFinish(isSucceeded: Bool, downloader: Downloader) {
		progressIndicator.stopAnimation(nil)
		progressIndicator.hidden = true
		searchButton.enabled = true
		languageSelector.enabled = true
		
		if isSucceeded {
			let alert = NSAlert()
			alert.addButtonWithTitle("OK")
			alert.messageText = "Succeeded"
			alert.informativeText = "We have fetched the data."
			alert.beginSheetModalForWindow(self.window!, completionHandler: {
				(response) -> Void in
				switch response {
				default:
					return
				}
			})
			
			//JSONData
			
			JSONData = JSON(downloader.storage!)
			
			tableView!.reloadData()
		}
		else {
			let alert = NSAlert()
			alert.addButtonWithTitle("OK")
			alert.messageText = "No content fetched"
			alert.informativeText = "A problem occured when fetching the data."
			alert.beginSheetModalForWindow(self.window!, completionHandler: {
				(response) -> Void in
				switch response {
				default:
					return
				}
			})
		}
	}
	
	// MARK: - > NSTableViewDelegate
	
	
	
	// MARK: - > NSTableViewDataSource

	func numberOfRowsInTableView(tableView: NSTableView) -> Int {
		if let data = JSONData {
			return data["results"]["albums"].count
		}
		return 0
	}
	
	func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
		if let data = JSONData {
			let content = data["results"]["albums"][row]
			switch tableColumn!.identifier {
			case "title":
				switch languageSelector.indexOfSelectedItem {
				case 0:
					return content["titles"]["ja"].string
				case 1:
					return content["titles"]["en"].string
				default:
					return content["titles"]["ja-latn"].string
				}
			case "catalog":
				return content["catalog"].string
			default:
				return content["release_date"].string
			}
		}
		return nil
	}
}
