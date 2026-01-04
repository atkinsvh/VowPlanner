import SwiftUI

@available(iOS 17.0, *)
struct AddGuestModal: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = GuestListViewModel()
    @State private var name = ""
    @State private var side: GuestSide = .yourSide
    @State private var groupTag: GuestGroupTag = .family
    @State private var guestsToAdd: [Guest] = []
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Guest Details")) {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Side", selection: $side) {
                        Text("Your side").tag(GuestSide.yourSide)
                        Text("Partner's side").tag(GuestSide.partnersSide)
                        Text("Joint").tag(GuestSide.joint)
                    }
                    
                    Picker("Group Tag", selection: $groupTag) {
                        Text("Family").tag(GuestGroupTag.family)
                        Text("Friends").tag(GuestGroupTag.friends)
                        Text("Work").tag(GuestGroupTag.work)
                        Text("Other").tag(GuestGroupTag.other)
                    }
                }
                
                Section {
                    Button("Add Guest") {
                        let guest = Guest(name: name, side: side, groupTag: groupTag)
                        guestsToAdd.append(guest)
                        name = ""
                        // Reset for next
                    }
                    
                    Button("Done") {
                        for guest in guestsToAdd {
                            viewModel.addGuest(name: guest.name, side: guest.side, groupTag: guest.groupTag)
                        }
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                    .foregroundColor(Color("Lavender"))
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Add Guest")
            .alert(item: Binding<IdentifiableError?>(
                get: { viewModel.errorMessage.map { IdentifiableError(message: $0) } },
                set: { _ in viewModel.errorMessage = nil }
            )) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}