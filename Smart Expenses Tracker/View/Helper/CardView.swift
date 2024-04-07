//
//  CardView.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 07.04.2024.
//

import SwiftUI

struct CardView: View {
    var income: Double
    var expense: Double
    var body: some View {
       
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            
            VStack(spacing: 0) {
                HStack(spacing: 12){
                    Text("")
                }
            }
        }
    }
}

#Preview {
    CardView(income: 4590, expense: 2389)
}
