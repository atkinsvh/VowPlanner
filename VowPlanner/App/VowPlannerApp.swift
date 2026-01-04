import SwiftUI

@available(iOS 17.0, *)
@main
struct VowPlannerApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(appState)
        }
    }
}