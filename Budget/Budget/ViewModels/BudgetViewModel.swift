//
//  BudgetViewModel.swift
//  Budget
//
//  Created by Nishant Tharani on 2/1/24.
//

import Foundation
import Combine

class BudgetViewModel: ObservableObject {
    @Published var monthIdx: Int
    @Published var categories: [BudgetCategory]
    // Decimal carriedOverAmount
    @Published var userAllocatedAmount: Decimal
    // Decimal totalAllocatedAmount
    @Published var unallocatedAmount: Decimal // TOCHECK can this not be calculated in the View?
    private var cancellables = Set<AnyCancellable>()

    init() {
        // Initialize with default values for now
        self.monthIdx = monthsSinceJanuary1970()
        self.categories = []
        self.totalAvailable = 0
        self.unallocatedAmount = 0
        
        // Load the budget for the current month, adjust the method to your data loading logic
        loadCurrentMonthBudget()
        
        // Calculate unallocated amount
        calculateUnallocatedAmount()
        
        // Observe changes in categories to update the unallocated amount
        $categories
            .sink { [weak self] _ in
                self?.calculateUnallocatedAmount()
            }
            .store(in: &cancellables)
    }

    private func loadCurrentMonthBudget() {
        // Implement loading logic here. For now, we'll initialize with some data.
        // In a real app, you would load this from UserDefaults, Core Data, or another store.
        let sampleCategories = [
            BudgetCategory(name: "Groceries", previousBalance: 0, amountAllocated: 100, carryOverOption: .carryOver),
            BudgetCategory(name: "Gas", previousBalance: 0, amountAllocated: 50, carryOverOption: .carryOver)
        ]
        
        self.categories = sampleCategories
        self.totalAvailable = 150
        self.unallocatedAmount = totalAvailable - categories.reduce(Decimal(0)) { $0 + $1.amountAllocated }
    }
    
    func calculateUnallocatedAmount() {
        let allocatedAmount = categories.reduce(Decimal(0)) { $0 + $1.amountAllocated }
        unallocatedAmount = totalAvailable - allocatedAmount
    }
    
    func updateCategory(_ category: BudgetCategory) {
        if let index = categories.firstIndex(where: { $0.id == category.id }) {
            categories[index] = category
            calculateUnallocatedAmount()
        }
    }
    
    func addCategory(name: String, allocatedAmount: Decimal) {
        let newCategory = BudgetCategory(name: name, previousBalance: 0, amountAllocated: allocatedAmount, carryOverOption: .carryOver)
        categories.append(newCategory)
        calculateUnallocatedAmount()
    }

    func deleteCategory(at indexSet: IndexSet) {
        categories.remove(atOffsets: indexSet)
        calculateUnallocatedAmount()
    }
    
    func archiveCategory(at indexSet: IndexSet) {
        // Implement the logic to archive a category.
        // This might involve moving the category to a different array or marking it as archived.
    }
    
    func loadBudget(for month: Date) {
        // Implement the logic to load budget data for a specific month.
        // This could involve filtering your data storage by the month.
    }
    
    // Add more functionalities as needed, such as saving data, handling carry over options, etc.
}
