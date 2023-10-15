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
    var limitTime = 10
    var earnedToday = 0
    var timer:Timer?
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCalculate), userInfo: nil, repeats: true)
        if let curTimer : Timer = timer{
            RunLoop.main.add(curTimer, forMode: .common)
        }
    }
    
    @objc public func startCalculate() {
        earnedToday = earnedToday + 1
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
