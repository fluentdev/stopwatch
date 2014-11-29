//
//  ViewController.swift
//  StopWatch
//
//  Created by Daina Corey on 11/13/14.
//  Copyright (c) 2014 Fluent Development. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var count = 0
    var hours = 0
    var mins = 0
    var seconds = 0
    var timer = NSTimer()
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBAction func startStopWatch(sender: AnyObject) {
        if(!timer.valid) {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
            println("Timer Started")
            navBar.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "startStopWatch:")
        } else {
            timer.invalidate()
            println("Timer Paused!")
            navBar.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "startStopWatch:")
        }
    }
    
    @IBAction func cancelStopWatch(sender: AnyObject) {
        timer.invalidate()
        count = 0
        hours = 0
        mins = 0
        seconds = 0
        lblTimer.text = "00:00:00.00"
        println("Timer Cancelled")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTimer.text = "00:00:00.00"
    }
    
    func result() {
        count++
        if(count==100) {
            count = 0
            seconds++
        }
        
        if(seconds == 60) {
            seconds = 0
            mins++
        }
        
        if(mins == 60) {
            mins = 0
            hours++
        }
        //        NSString *paddedStr = [NSString stringWithFormat:@"%010d", 42];
        var hh = String(format: "%02d",hours)
        var mm = String(format: "%02d", mins)
        var ss = String(format: "%02d", seconds)
        var cc = String(format: "%02d", count)
        
        lblTimer.text = "\(hh):\(mm):\(ss).\(cc)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

