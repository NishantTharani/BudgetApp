//
//  BudgetsView.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import SwiftUI

struct BudgetsView: View {
    @ObservedObject var viewModel: BudgetViewModel

    var body: some View {
        NavigationView {
            VStack {
                // Total available to spend
                // Categories list
                // Add category button
                // Archived categories button
            }
            .navigationTitle("Budgets")
        }
        .tabItem {
            Label("Budgets", systemImage: "wallet.pass")
        }
    }
}

struct BudgetsView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetsView(viewModel: BudgetViewModel())
    }
}

