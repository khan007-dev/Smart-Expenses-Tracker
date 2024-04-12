//
//  Smart_Expenses_TrackerApp.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 04.04.2024.
//

import SwiftUI
import WidgetKit

@main
struct Smart_Expenses_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    WidgetCenter.shared.reloadAllTimelines()
                }
        }
        .modelContainer(for: [Transaction.self])
    }
}
