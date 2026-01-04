import SwiftUI
import Combine
// Assuming GuestModel is in the same module or imported

@available(iOS 17.0, *)
final class GuestListViewModel: ObservableObject {
    @Published var guests: [Guest] = []
    @Published var isAddingGuest = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadGuests()
    }
    
    func addGuest(name: String, side: GuestSide, groupTag: GuestGroupTag) {
        do {
            let guest = Guest(name: name, side: side, groupTag: groupTag)
            try guest.validate()
            guests.append(guest)
            saveGuests()
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func removeGuest(at index: Int) {
        guests.remove(at: index)
        saveGuests()
    }
    
    private func loadGuests() {
        guests = StorageManager.load([Guest].self, from: "guests.json") ?? []
    }
    
    private func saveGuests() {
        StorageManager.save(guests, to: "guests.json")
    }
}