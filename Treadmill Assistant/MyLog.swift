//
//  MyLog.swift
//  Treadmill Assistant
//
//  Created by Michael Crump on 1/16/15.
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import Foundation
import CoreData

class MyLog: NSManagedObject {

    @NSManaged var milesRan: NSNumber
    @NSManaged var totalDuration: NSDate
    @NSManaged var dateOfRun: NSDate

}
