import SwiftUI

// Profile screen with user information and settings
struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Profile Header
                    VStack(spacing: 15) {
                        // Placeholder for profile picture
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                            )
                        
                        VStack(spacing: 5) {
                            Text("John Doe")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("john.doe@example.com")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Stats Section
                    HStack(spacing: 30) {
                        StatItem(number: "42", label: "Items")
                        StatItem(number: "128", label: "Points")
                        StatItem(number: "15", label: "Badges")
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    // Menu Items
                    VStack(spacing: 0) {
                        MenuItem(icon: "person.crop.circle", title: "Edit Profile")
                        MenuItem(icon: "bell", title: "Notifications")
                        MenuItem(icon: "shield", title: "Privacy")
                        MenuItem(icon: "questionmark.circle", title: "Help & Support")
                        MenuItem(icon: "gear", title: "Settings")
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.1), radius: 5)
                    .padding(.horizontal)
                    
                    // Sign Out Button
                    Button(action: {
                        // Sign out action
                    }) {
                        HStack {
                            Image(systemName: "arrow.right.square")
                            Text("Sign Out")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .foregroundColor(.red)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
            }
            .navigationTitle("Profile")
        }
    }
}

// Reusable component for statistics
struct StatItem: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(number)
                .font(.title2)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

// Reusable component for menu items
struct MenuItem: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 25)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            // Handle tap action
        }
        
        // Add divider except for last item
        if title != "Settings" {
            Divider()
                .padding(.leading, 50)
        }
    }
}

#Preview {
    ProfileView()
}