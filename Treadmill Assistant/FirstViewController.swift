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
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: self.managedObjectContext!) as MyLog
        
        newItem.milesRan = 3
        newItem.dateOfRun = NSDate()
        newItem.totalDuration = NSDate()
        presentItemInfo()
       
       
    }
   
    func presentItemInfo() {
        let fetchRequest = NSFetchRequest(entityName: "LogItem")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [MyLog] {
            
            let alert = UIAlertController(title: fetchResults[0].milesRan.stringValue,
                message: fetchResults[0].dateOfRun.description,
                preferredStyle: .Alert)
            
            self.presentViewController(alert,
                animated: true,
                completion: nil)
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

