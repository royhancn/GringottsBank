//
//  StatusBarView.swift
//  GringottsBank
//
//  Created by Roy on 2023/10/15.
//

import SwiftUI

struct StatusBarView: View {
    @ObservedObject var statusDataModel = SharedStore.statusDataModel
    
    var body: some View {
        Text(String(statusDataModel.earnedToday))
    }
}

#Preview {
    StatusBarView()
}
