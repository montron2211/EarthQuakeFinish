//
//  DetailViewController.swift
//  EarthQuakeApp
//
//  Created by Monmon on 5/21/19.
//  Copyright © 2019 Monmon. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var urlString = ""
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myWebView)
        if let url = URL(string: urlString) {
            myWebView.load(URLRequest(url: url))
        }

    }
    


}
