//
//  StatusBarView.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import SwiftUI

struct StatusBarView: View {
    @ObservedObject var statusDataModel = SharedStore.statusDataModel
    
    // Reserve 2 decimal for the final salary
    var body: some View {
        Text(String(format: "%.2f", statusDataModel.earnedToday))
    }
}

#Preview {
    StatusBarView()
}
