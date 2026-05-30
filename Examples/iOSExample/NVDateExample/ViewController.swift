//
//  ViewController.swift
//  test
//
//  Created by Noval Agung Prayogo on 25/05/18.
//  Copyright © 2018 Noval Agung Prayogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someday = NVDate()
            .previousDay()
            .previousWeek()
            .nextDay()
            .asString()
        
        print(someday)
        // someday: 2013-12-08 17:03:36
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

