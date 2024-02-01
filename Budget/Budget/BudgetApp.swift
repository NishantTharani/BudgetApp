//
//  BudgetApp.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import SwiftUI

@main
struct BudgetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}