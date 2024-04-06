//
//  DateExtension.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 06.04.2024.
//

import SwiftUI


extension Date {
    
    var startOfMonth: Date {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        
        return calendar.date(from: components) ?? self
        
    }
    
//    var endOfMonth: Date {
//
//    }
}
