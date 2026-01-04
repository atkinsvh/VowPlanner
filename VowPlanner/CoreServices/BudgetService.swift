import Foundation

class BudgetService {
    static let shared = BudgetService()
    
    private init() {}
    
    func setupBudget(lines: [BudgetCategory]) {
        // Setup budget
        print("Budget setup with \(lines.count) lines")
    }
    
    func trackSpending(category: BudgetCategory, amount: Double) {
        // Track spending
        print("Tracked $\(amount) in \(category.name)")
    }
}