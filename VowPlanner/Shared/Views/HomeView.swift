import SwiftUI

@available(iOS 17.0, *)
struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var showAddGuestModal = false
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Timeline", destination: TimelineView())
                NavigationLink("Budget", destination: BudgetView())
                NavigationLink("Guests", destination: GuestsView())
                NavigationLink("Vendors", destination: VendorsView())
                NavigationLink("Couple Life", destination: CoupleLifeView())
            }
            .navigationTitle("VowPlanner")
            .toolbar {
                Button("Add Guest") {
                    showAddGuestModal = true
                }
            }
            .sheet(isPresented: $showAddGuestModal) {
                AddGuestModal()
            }
        }
    }
}