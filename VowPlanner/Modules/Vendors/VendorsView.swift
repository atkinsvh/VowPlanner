import SwiftUI

@available(iOS 17.0, *)
struct VendorsView: View {
    @State var vendors: [Vendor] = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(vendors, id: \.id) { vendor in
                    VStack {
                        Text(vendor.name)
                        Text(vendor.category)
                        if let phone = vendor.phone {
                            Button("Call") {
                                if let url = URL(string: "tel:\(phone)") {
                                    #if canImport(UIKit)
                                    UIApplication.shared.open(url)
                                    #endif
                                }
                            }
                        }
                        if let email = vendor.email {
                            Button("Email") {
                                if let url = URL(string: "mailto:\(email)") {
                                    #if canImport(UIKit)
                                    UIApplication.shared.open(url)
                                    #endif
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
            }
        }
        .navigationTitle("Vendors")
        .onAppear {
            vendors = StorageManager.load([Vendor].self, from: "vendors.json") ?? []
        }
        .onDisappear {
            StorageManager.save(vendors, to: "vendors.json")
        }
    }
}