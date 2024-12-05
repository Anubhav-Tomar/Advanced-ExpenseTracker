//
//  Tab.swift
//  Advanced Expense Tracker
//
//  Created by Anubhav Tomar on 30/11/24.
//

import SwiftUI

enum Tab: String {
    case recents = "Recents"
    case search = "Filter"
    case charts = "Charts"
    case settings = "Settings"
 
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .recents:
            Image(systemName: "calendar")
                .environment(\.symbolVariants, .none)

            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyingglass")

            Text(self.rawValue)
        case .charts:
            Image(systemName: "chart.bar.xaxis")

            Text(self.rawValue)
        case .settings:
            Image(systemName: "gearshape")
                .environment(\.symbolVariants, .none)

            Text(self.rawValue)
        }
    }
}
