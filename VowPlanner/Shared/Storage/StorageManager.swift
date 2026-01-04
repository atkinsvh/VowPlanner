import Foundation

class StorageManager {
    static func load<T: Codable>(_ type: T.Type, from file: String) -> T? {
        let url = getDocumentsDirectory().appendingPathComponent(file)
        guard let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    static func save<T: Codable>(_ data: T, to file: String) {
        let url = getDocumentsDirectory().appendingPathComponent(file)
        try? JSONEncoder().encode(data).write(to: url)
    }
    
    private static func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}