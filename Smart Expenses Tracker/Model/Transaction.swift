//
//  Transaction.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 06.04.2024.
//

import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = .init()
    
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    // Extracting Color value from tintColor String
    
    var color: Color {
        return tints.first (where: {  $0.color == tintColor })?.value ?? appTint
    }
}


var sampleTransactions: [Transaction] = [
    .init(title: "Magic Keyboard", remarks: "Apple Product", amount: 129, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Apple Music", remarks: "Apple Product", amount: 129, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Game iCloud", remarks: "Apple Product", amount: 33, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Online Payment", remarks: "Apple Product", amount: 44, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Mac Salary", remarks: "Apple Product", amount: 2345, dateAdded: .now, category: .income, tintColor: tints.randomElement()!)
                                        ]
