//
//  BudgetApp.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import SwiftUI
import SwiftData

@main
struct BudgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Budget.self)
    }
}
