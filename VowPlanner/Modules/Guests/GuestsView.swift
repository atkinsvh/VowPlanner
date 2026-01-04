import SwiftUI

@available(iOS 17.0, *)
struct GuestsView: View {
    @State var guests: [Guest] = []
    @State var filter: RSVPStatus? = nil
    
    var filteredGuests: [Guest] {
        guests.filter { filter == nil || $0.rsvpStatus == filter }
    }
    
    var body: some View {
        VStack {
            Picker("Filter", selection: $filter) {
                Text("All").tag(RSVPStatus?.none)
                Text("Attending").tag(RSVPStatus?.some(.attending))
                Text("Declined").tag(RSVPStatus?.some(.declined))
                Text("No Response").tag(RSVPStatus?.some(.noResponse))
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List {
                ForEach(filteredGuests, id: \.id) { guest in
                    NavigationLink(destination: GuestDetailView(guest: guest)) {
                        Text(guest.name)
                    }
                }
            }
        }
        .navigationTitle("Guests")
        .onAppear {
            guests = StorageManager.load([Guest].self, from: "guests.json") ?? []
        }
        .onDisappear {
            StorageManager.save(guests, to: "guests.json")
        }
    }
}

@available(iOS 17.0, *)
struct GuestDetailView: View {
    @State var guest: Guest
    
    var body: some View {
        Form {
            TextField("Name", text: $guest.name)
            Picker("RSVP", selection: $guest.rsvpStatus) {
                Text("Attending").tag(RSVPStatus.attending)
                Text("Declined").tag(RSVPStatus.declined)
                Text("No Response").tag(RSVPStatus.noResponse)
            }
            TextField("Meal Choice", text: Binding($guest.mealChoice, default: ""))
            TextField("Dietary Notes", text: Binding($guest.dietaryNotes, default: ""))
            TextField("Household", text: Binding($guest.household, default: ""))
        }
        .navigationTitle("Guest Details")
    }
}

extension Binding {
    init(_ source: Binding<Value?>, default defaultValue: Value) where Value: Equatable {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}