//
//  BudgetCategory.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation

struct BudgetCategory: Identifiable, Codable {
    var id = UUID()
    var name: String
    var previousBalance: Decimal
    var amountAllocated: Decimal
    var carryOverOption: CarryOverOption

    enum CarryOverOption: String, Codable, CaseIterable {
        case carryOver = "Carry Over"
        case discard = "Discard"
        case apply = "Apply"
    }
}
