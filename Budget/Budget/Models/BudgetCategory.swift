//
//  BudgetCategory.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation
import SwiftData

@Model
final class BudgetCategory {
    var id = UUID()
    var name: String
    var previousBalance: Decimal
    var amountAllocated: Decimal
    var carryOverOption: CarryOverOption

    enum CarryOverOption: String, Codable, CaseIterable {
        case carry = "CARRYOVER_CARRY"
        case discard = "CARRYOVER_DISCARD"
        case apply = "CARRYOVER_APPLY"
    }
    
    init(name: String, previousBalance: Decimal, amountAllocated: Decimal, carryOverOption: CarryOverOption) {
        self.name = name
        self.previousBalance = previousBalance
        self.amountAllocated = amountAllocated
        self.carryOverOption = carryOverOption
    }
}
