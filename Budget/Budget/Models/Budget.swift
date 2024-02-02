//
//  Budget.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation
import SwiftData

@Model
final class Budget {
    var monthIdx: Int32
    var categories: [BudgetCategory]
    var userAllocatedAmount: Decimal
    var unallocatedAmount: Decimal
    
    // Decimal carriedOverAmount
    // Decimal totalAllocatedAmount
    
    init(monthIdx: Int32, categories: [BudgetCategory], userAllocatedAmount: Decimal, unallocatedAmount: Decimal) {
        self.monthIdx = monthIdx
        self.categories = categories
        self.userAllocatedAmount = userAllocatedAmount
        self.unallocatedAmount = unallocatedAmount
    }
    
}
