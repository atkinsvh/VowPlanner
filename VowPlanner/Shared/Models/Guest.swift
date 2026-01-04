import Foundation

struct Guest: Codable, Identifiable {
    var id = UUID()
    var name: String
    var side: GuestSide
    var groupTag: GuestGroupTag
    var rsvpStatus: RSVPStatus = .noResponse
    var mealChoice: String?
    var dietaryNotes: String?
    var household: String?
    
    init(name: String, side: GuestSide, groupTag: GuestGroupTag, rsvpStatus: RSVPStatus = .noResponse, mealChoice: String? = nil, dietaryNotes: String? = nil, household: String? = nil) {
        self.name = name
        self.side = side
        self.groupTag = groupTag
        self.rsvpStatus = rsvpStatus
        self.mealChoice = mealChoice
        self.dietaryNotes = dietaryNotes
        self.household = household
    }
    
    func validate() throws {
        if name.isEmpty {
            throw GuestError.invalidName
        }
        // Add more validations if needed
    }
}