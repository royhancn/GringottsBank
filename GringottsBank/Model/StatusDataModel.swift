//
//  StatusDataModel.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import Foundation

class StatusDataModel: ObservableObject {
    @Published var earnedToday: Double = 0
    @Published var earnedThisMonth: Double = 0
    
    public func update(earnedToday: Double, earnedThisMonth: Double) {
        self.earnedToday = earnedToday
        self.earnedThisMonth = earnedThisMonth
    }
}
