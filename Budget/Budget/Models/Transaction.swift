//
//  Transaction.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation

struct Transaction: Identifiable, Codable {
    var id = UUID()
    var amount: Decimal
    var category: String
    var date: Date
}
