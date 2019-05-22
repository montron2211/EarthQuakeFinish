//
//  ViewController.swift
//  EarthQuakeApp
//
//  Created by Monmon on 5/21/19.
//  Copyright © 2019 Monmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.sharedInstance.makeDataTaskRequest { (data) in
            print(data.features[0].mag!)
        }
    }


}

