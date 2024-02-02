//
//  utils.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation

func monthsSinceJanuary1970() -> Int {
    let calendar = Calendar.current
    let now = Date()
    let startOf1970 = Date(timeIntervalSince1970: 0)
    let components = calendar.dateComponents([.month], from: startOf1970, to: now)
    return components.month ?? 0
}
