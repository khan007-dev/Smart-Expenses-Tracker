//
//  IntroScreen.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 04.04.2024.
//

import SwiftUI

struct IntroScreen: View {
    // Visibility Status
    
    @AppStorage("isFirsttime") private var isFirstTime: Bool = true
    var body: some View {
      
        VStack(spacing: 15) {
            
            Text("What's New in the \n Expense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            // Points View
            
            VStack (alignment: .leading, spacing: 25) {
                
                PointView(symbol: "dollarsign", title: "Transaction", subTitle: "Keep Track of your earning and expenses")
                PointView(symbol: "chart.bar.fill", title: "Transaction", subTitle: "Keep Track of your earning and expenses")
                PointView(symbol: "magnifyingglass", title: "Transaction", subTitle: "Keep Track of your earning and expenses")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }.padding()
        
        
    }
    
    // Point View
    @ViewBuilder
    func PointView (symbol: String, title: String, subTitle: String) -> some View {
        
        HStack (spacing: 20) {
            
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack (alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subTitle)
                    .foregroundStyle(.gray)
            }
        }
        
    }
}

#Preview {
    IntroScreen()
}
