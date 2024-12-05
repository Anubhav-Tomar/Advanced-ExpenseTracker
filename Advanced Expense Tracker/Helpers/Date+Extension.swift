//
//  Date+Extension.swift
//  Advanced Expense Tracker
//
//  Created by Anubhav Tomar on 01/12/24.
//

import SwiftUI

extension Date {
    var startOfMonth: Date {
        let calendra = Calendar.current
        let components = calendra.dateComponents([.year, .month], from: self)
        
        return calendra.date(from: components) ?? self
    }
    
    var endOfMonth: Date {
        let calendra = Calendar.current
        
        return calendra.date(byAdding: .init(month: 1, minute: -1), to: self.startOfMonth) ?? self
    }
}
