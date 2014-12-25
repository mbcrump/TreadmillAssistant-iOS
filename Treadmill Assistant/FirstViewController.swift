//
//  FirstViewController.swift
//  Treadmill Assistant
//
//  Created by Michael Crump on 12/20/14.
//  Copyright (c) 2014 Michael Crump. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var chart = TKChart(frame: CGRectInset(self.view.bounds, 30, 30))
        self.view.addSubview(chart)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
