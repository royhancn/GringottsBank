//
//  StatusDataModel.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import Foundation

class StatusDataModel: ObservableObject {
    @Published var earnedToday: Int = 0
    @Published var earnedThisMonth: Int = 0
    
    public func update(earnedToday: Int, earnedThisMonth: Int) {
        self.earnedToday = earnedToday
        self.earnedThisMonth = earnedThisMonth
    }
}
