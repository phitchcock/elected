//
//  AlamofireViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/28/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class AlamofireViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL (string: "https://github.com/Alamofire/Alamofire")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
