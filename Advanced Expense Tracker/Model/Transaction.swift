//
//  Transaction.swift
//  Advanced Expense Tracker
//
//  Created by Anubhav Tomar on 30/11/24.
//

import SwiftUI
import SwiftData

@Model
class Transaction {
    
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
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? appTint
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first(where: { $0.color == tintColor })
    }
    
    @Transient
    var rawCategory: Category? {
        return Category.allCases.first(where: { category == $0.rawValue })
    }
}


// Sample transactions for UI building
//var sampleTransaction: [Transaction] = [
//    .init(title: "Magic Keyboard", remarks: "Apple Product", amount: 9999, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Apple Music", remarks: "Suscription", amount: 99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "iCloud+", remarks: "Suscription", amount: 349, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Payment", remarks: "Payment Received", amount: 10000, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),
//]
