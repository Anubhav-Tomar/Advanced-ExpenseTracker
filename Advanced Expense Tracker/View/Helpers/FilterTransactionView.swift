//
//  FilterTransactionView.swift
//  Advanced Expense Tracker
//
//  Created by Anubhav Tomar on 03/12/24.
//

import SwiftUI
import SwiftData

struct FilterTransactionView<Content: View>: View {
    
    var content: ([Transaction]) -> Content
    
    @Query(animation: .snappy) private var transactions: [Transaction]
    init(category: Category?, seacrhText: String, @ViewBuilder content: @escaping ([Transaction]) -> Content ) {
        
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Transaction> { transaction in
            return (transaction.title.localizedStandardContains(seacrhText) ||
            transaction.remarks.localizedStandardContains(seacrhText)) &&
            (rawValue.isEmpty ? true : transaction.category == rawValue)
        }
        
        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    init(startDate: Date, endDate: Date, @ViewBuilder content: @escaping ([Transaction]) -> Content ) {
        
        let predicate = #Predicate<Transaction> { transaction in
            return transaction.dateAdded >= startDate && transaction.dateAdded <= endDate
        }
        
        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    init(startDate: Date, endDate: Date, category: Category?, @ViewBuilder content: @escaping ([Transaction]) -> Content ) {
        
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Transaction> { transaction in
            return transaction.dateAdded >= startDate && transaction.dateAdded <= endDate &&
            (rawValue.isEmpty ? true : transaction.category == rawValue)
        }
        
        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    var body: some View {
        content(transactions)
    }
}
