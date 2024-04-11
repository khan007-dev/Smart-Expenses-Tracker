//
//  Settings.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 06.04.2024.
//

import SwiftUI

struct Settings: View {
    /// User Properties
    @AppStorage("userName") private var userName: String = ""
  
    
    /// App Lock Properties
    
    @AppStorage("isApLockEnabled") private var isAppLockEnabled: Bool = true
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = true
    var body: some View {
        
        NavigationStack {
            List {
                Section("User Name") {
                    TextField("AB Waris", text: $userName)
                    
                }
                
                Section("App Lock") {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled {
                        Toggle("Lock when App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
