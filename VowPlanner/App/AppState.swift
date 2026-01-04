import SwiftUI

@available(iOS 13.0, *)
class AppState: ObservableObject {
    @Published var weddingDate: Date = Date()
}