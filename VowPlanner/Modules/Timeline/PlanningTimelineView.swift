import SwiftUI

@available(iOS 17.0, *)
struct TimelineView: View {
    @EnvironmentObject var appState: AppState
    @State var items: [TimelineItem] = []
    
    var body: some View {
        List($items, id: \.id) { $item in
            HStack {
                TextField("Title", text: $item.title)
                DatePicker("", selection: $item.dueDate, displayedComponents: .date)
                Toggle("", isOn: $item.completed)
            }
        }
        .navigationTitle("Timeline")
        .onAppear {
            items = StorageManager.load([TimelineItem].self, from: "timeline.json") ?? generateTimeline(from: appState.weddingDate)
        }
        .onDisappear {
            StorageManager.save(items, to: "timeline.json")
        }
    }
    
    func generateTimeline(from date: Date) -> [TimelineItem] {
        var items: [TimelineItem] = []
        let calendar = Calendar.current
        for i in 0..<12 {
            if let dueDate = calendar.date(byAdding: .month, value: -(12 - i), to: date) {
                let title: String
                switch i {
                case 0: title = "Book Venue"
                case 1: title = "Hire Photographer"
                case 2: title = "Send Invitations"
                case 3: title = "Choose Cake"
                case 4: title = "Buy Dress"
                case 5: title = "Plan Honeymoon"
                case 6: title = "Select Music"
                case 7: title = "Arrange Transportation"
                case 8: title = "Finalize Menu"
                case 9: title = "Book Officiant"
                case 10: title = "Send Thank Yous"
                case 11: title = "Wedding Day"
                default: title = "Milestone \(i+1)"
                }
                items.append(TimelineItem(title: title, dueDate: dueDate, completed: false))
            }
        }
        return items
    }
}