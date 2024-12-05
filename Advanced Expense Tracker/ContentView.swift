//
//  ContentView.swift
//  Advanced Expense Tracker
//
//  Created by Anubhav Tomar on 30/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false

    @State private var activeTabs: Tab = .recents
    
    var body: some View {
        LockView(lockType: .both, lockPin: "0000", isEnabled: isAppLockEnabled, lockWhenAppGoesToBackground: lockWhenAppGoesBackground) {
            TabView(selection: $activeTabs) {
                Recent()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                
                Search()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent }
                
                Graphs()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent }
                
                Settings()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent }
            }
            .tint(appTint)
            .sheet(isPresented: $isFirstTime) {
                IntroScreen()
                    .interactiveDismissDisabled()
             }
        }
    }
}

#Preview {
    ContentView()
}
