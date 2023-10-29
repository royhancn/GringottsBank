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
    @State private var doAlert = false
    let alertTitle: String = "Poor kid..."
    
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        // Disable separator
        formatter.usesGroupingSeparator = false
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
                //.focused($isFocused)
                .onAppear {
                    // Read the current monthlySalary value upon Settings Window Load
                    monthlySalary = configDataModel.monthlySalary
                }
        }.padding(.all)
        
        Button("Apply"){
            if monthlySalary < 100000 {
                doAlert = true
            }
        }.buttonStyle(.bordered)
            .alert(
                alertTitle,
                isPresented: $doAlert
            ) {
                Button(role: .destructive) {
                    self.configDataModel.updateConfig(monthlySalary: monthlySalary)
                } label: {
                    Text("Alright")
                }
                Button("You bad bad") {
                    // Do nothing.
                }
            } message: {
                Text("Are you sure you only earn such little amount of salary? So sad.")
        }
    }
}
