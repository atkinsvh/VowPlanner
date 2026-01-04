import SwiftUI

// Main view of the app - This is what users see when they open the app
// Using TabView for easy navigation between different sections
struct ContentView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Explore Tab
            ExploreView()
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("Explore")
                }
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        // This makes the tab bar look modern
        .accentColor(.blue)
    }
}

// Preview provider for Xcode canvas - lets you see the design without running
#Preview {
    ContentView()
}