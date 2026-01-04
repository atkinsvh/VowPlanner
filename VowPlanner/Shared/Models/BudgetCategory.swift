import Foundation

struct BudgetCategory: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var allocated: Double
    var spent: Double
}