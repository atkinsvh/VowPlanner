import Foundation

struct TimelineItem: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var dueDate: Date
    var completed: Bool
}