//
//  SettingsView.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var configDataModel = SharedStore.configDataModel
    @State private var monthlySalary:Double = 0
    
    private static let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        Text("Placeholder for settings")
            .frame(width: 200, height: 100, alignment: .center)
        HStack{
                Text("Monthly Salary")
                Spacer()
                TextField("Please input your monthly salary", value:$monthlySalary, formatter: Self.formatter)
        }.padding(.all)
        
        Button("Apply"){
            self.configDataModel.updateConfig(monthlySalary: monthlySalary)
        }.buttonStyle(.bordered)
    }
}
