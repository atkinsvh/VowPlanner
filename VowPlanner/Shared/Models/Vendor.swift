import Foundation

struct Vendor: Identifiable, Codable {
    var id: UUID = UUID()
    var category: String
    var name: String
    var phone: String?
    var email: String?
    var website: String?
    var notes: String?
    var estimatedCost: Double?
}