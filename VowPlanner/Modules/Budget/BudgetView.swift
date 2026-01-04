import SwiftUI

@available(iOS 17.0, *)
struct BudgetView: View {
    @State var categories: [BudgetCategory] = []
    
    var body: some View {
        List {
            ForEach(categories, id: \.id) { cat in
                VStack(alignment: .leading) {
                    Text(cat.name)
                    ProgressBarView(progress: cat.allocated > 0 ? cat.spent / cat.allocated : 0)
                    Text("$\(cat.spent, specifier: "%.2f") / $\(cat.allocated, specifier: "%.2f")")
                }
            }
        }
        .navigationTitle("Budget")
        .onAppear {
            categories = StorageManager.load([BudgetCategory].self, from: "budget.json") ?? [
                BudgetCategory(name: "Venue", allocated: 10000, spent: 8000),
                BudgetCategory(name: "Catering", allocated: 5000, spent: 4500),
                BudgetCategory(name: "Photography", allocated: 3000, spent: 2500)
            ]
        }
        .onDisappear {
            StorageManager.save(categories, to: "budget.json")
        }
    }
}