//
//  FirstViewController.swift
//  Treadmill Assistant
//
//  Created by Michael Crump on 12/20/14.
//  Copyright (c) 2014 Michael Crump. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class FirstViewController: UIViewController {
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(managedObjectContext!)
       
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

