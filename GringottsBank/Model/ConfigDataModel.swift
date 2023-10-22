//
//  ConfigDataModel.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/22.
//

import Foundation

class ConfigDataModel: ObservableObject {
    @Published var monthlySalary: Double = 22000
    
    public func updateConfig(monthlySalary: Double) {
        self.monthlySalary = monthlySalary
    }
}
