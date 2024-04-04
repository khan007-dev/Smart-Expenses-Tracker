//
//  ContentView.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 04.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @AppStorage("isFirsttime") private var isFirstTime: Bool = true
        // Active Tab
    
    @State private var activeTab: Tab = .recents
    var body: some View {
        
        TabView (selection: $activeTab) {
            
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            
            Text("Search")
                .tag(Tab.recents)
                .tabItem { Tab.search.tabContent }
            
            Text("Chart")
                .tag(Tab.recents)
                .tabItem { Tab.charts.tabContent }
            
            Text("Settings")
                .tag(Tab.recents)
                .tabItem { Tab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
