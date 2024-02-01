//
//  Budget.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation

struct Budget: Identifiable, Codable {
    var id = UUID()
    var month: Date
    var categories: [BudgetCategory]
    var totalAvailable: Decimal
}
