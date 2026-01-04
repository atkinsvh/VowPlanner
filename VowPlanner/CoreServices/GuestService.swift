import Foundation

class GuestService {
    static let shared = GuestService()
    
    private init() {}
    
    func addGuest(_ guest: Guest) {
        // Add guest to list
        print("Added guest: \(guest.name)")
    }
    
    func editGuest(_ guest: Guest) {
        // Edit guest
        print("Edited guest: \(guest.name)")
    }
    
    func getGuests() -> [Guest] {
        // Return guest list
        return []
    }
}