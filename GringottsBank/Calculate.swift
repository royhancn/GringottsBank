//
//  Calculate.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import Foundation
import SwiftUI

class Calculate {
    @ObservedObject var statusDataModel = SharedStore.statusDataModel
    
    // Limited time of loop
    var limitTime = 10000
    
    var earnedToday = Double(0)
    var monthlySalary = Double(22000)
    var workingDays = Double(21.75)
    var workingHours = 8
    var totalWorkingTimeMS = Double(0)
    
    // Use Swift Timer to enable the regular refresh of the APP since sleep() function will cause entire thread to sleep
    var timer:Timer?
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(startCalculate), userInfo: nil, repeats: true)
        if let curTimer : Timer = timer{
            RunLoop.main.add(curTimer, forMode: .common)
        }
    }
    
    @objc public func startCalculate() {
        var unixTimeStampMS = 0
        
        // Get current unix timestamp in milliseconds
        unixTimeStampMS = Int(Date().timeIntervalSince1970 * 1000)
        var startWorkingTimeUnix = 0
        
        // Translate data format for start working time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let startWorkingTime = dateFormatter.date(from: "2023-10-22 09:30:00")
        
        startWorkingTimeUnix = Int(startWorkingTime!.timeIntervalSince1970 * 1000)
        
        // Calculate how many MS worked today
        let timeGap = Double(unixTimeStampMS - startWorkingTimeUnix)
        totalWorkingTimeMS = Double(workingHours * 60 * 60 * 1000)
        
        // Money earned today = Monthly Salary devided by working days in a month multiply by percentage of today's working hours
        earnedToday = Double(monthlySalary/workingDays)*Double(timeGap/totalWorkingTimeMS)
        
        self.statusDataModel.update(earnedToday: earnedToday, earnedThisMonth: earnedToday)
        limitTime = limitTime - 1
        if limitTime == 0 {
            cancelTimer()
        }
    }
    
    deinit {
        cancelTimer()
    }
    
    func cancelTimer(){
        if (timer != nil) {
            timer?.invalidate()
            timer = nil
        }
    }
}
