//
//  IntroScreen.swift
//  Advanced Expense Tracker
//
//  Created by Anubhav Tomar on 30/11/24.
//

import SwiftUI

struct IntroScreen: View {
    
    // Visiblity Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    var body: some View {
        VStack(spacing: 15) {
            Text("What's new in the \n Expense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            VStack(alignment: .leading, spacing: 25) {
                pointView(symbol: "dollarsign", title: "Transactions", subTitle: "Keep track of your earning and expenses.")
                
                pointView(symbol: "chart.bar.fill", title: "Visual Charts", subTitle: "View your transaction using eye-catching graphic representation.")
                
                pointView(symbol: "magnifyingglass", title: "Advance Filters", subTitle: "Find the expenses you want by using advanced search and filtering.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
            
            Spacer()
            
            Button {
                isFirstTime.toggle()
            } label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 18))
                    .contentShape(.rect)
            }
        }
        .padding(15)
    }
    
    // Point View
    @ViewBuilder
    func pointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subTitle)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    IntroScreen()
}
