//
//  HanekeViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/28/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class HanekeViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL (string: "https://github.com/Haneke/HanekeSwift")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
