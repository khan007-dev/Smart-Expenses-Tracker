//
//  ContentView.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 04.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @AppStorage("isFirsttime") private var isFirstTime: Bool = true
    
    /// App Lock Properties
    @AppStorage("isApLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
        // Active Tab
    
    @State private var activeTab: Tab = .recents
    var body: some View {
        
        LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
            
            TabView (selection: $activeTab) {
                
                Recents()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                
                Search()
                    .tag(Tab.recents)
                    .tabItem { Tab.search.tabContent }
                
                Graphs()
                    .tag(Tab.recents)
                    .tabItem { Tab.charts.tabContent }
                
                Settings()
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
}

#Preview {
    ContentView()
}
