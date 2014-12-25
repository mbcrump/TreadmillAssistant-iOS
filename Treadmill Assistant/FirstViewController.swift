//
//  FirstViewController.swift
//  Treadmill Assistant
//
//  Created by Michael Crump on 12/20/14.
//  Copyright (c) 2014 Michael Crump. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: UIViewController, TKCalendarDataSource, TKCalendarDelegate {

    var events = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendarView = TKCalendar(frame: self.view.bounds)
        calendarView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        self.view.addSubview(calendarView)
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.minDate = TKCalendar.dateWithYear(2010, month: 1, day: 1, withCalendar: nil)
        calendarView.maxDate = TKCalendar.dateWithYear(2016, month: 12, day: 31, withCalendar: nil)
        
        var calendar = NSCalendar.currentCalendar()
        var date = NSDate()
        for i in 0..<10 {
            let event = TKCalendarEvent()
            event.title = "Sample event"
            let components = calendar.components(NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.HourCalendarUnit, fromDate: date)
            let random = Int(arc4random() % 20)
            components.day += random > 10 ? 20 - random : -random
            event.startDate = calendar.dateFromComponents(components)
            components.hour += 2
            event.endDate = calendar.dateFromComponents(components)
            event.eventColor = UIColor.redColor()
            self.events.addObject(event)
        }
        
        let components = NSDateComponents()
        components.year = 2015
        components.month = 5
        components.day = 1
        let newDate = calendarView.calendar.dateFromComponents(components)
        calendarView.navigateToDate(newDate, animated: false)
        calendarView.viewMode = TKCalendarViewMode.Month
    }
   
    func calendar(calendar: TKCalendar!, eventsForDate date: NSDate!) -> [AnyObject]! {
        let components = calendar.calendar.components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: date)
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.calendar.dateFromComponents(components)
        let predicate = NSPredicate(format: "(startDate <= %@) AND (endDate >= %@)", endDate!, date)
        return self.events.filteredArrayUsingPredicate(predicate!)
    }
    
    func calendar(calendar: TKCalendar!, didSelectDate date: NSDate!) {
        NSLog("%@", date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

