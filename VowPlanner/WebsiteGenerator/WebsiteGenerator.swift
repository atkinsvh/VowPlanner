import Foundation

class WebsiteGenerator {
    static let shared = WebsiteGenerator()
    
    private init() {}
    
    func generateHTML(from data: [String: Any]) -> String {
        // Generate HTML/CSS for wedding website
        let title = data["title"] as? String ?? "Wedding"
        let date = data["date"] as? String ?? "TBD"
        return """
        <html>
        <head><title>\(title)</title></head>
        <body>
        <h1>\(title)</h1>
        <p>Date: \(date)</p>
        </body>
        </html>
        """
    }
}