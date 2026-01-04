import Foundation

enum GuestError: Error {
    case invalidName
    case invalidSide
    case invalidGroupTag
}

enum GuestSide: String, Codable {
    case yourSide = "Your side"
    case partnersSide = "Partner's side"
    case joint = "Joint"
}

enum GuestGroupTag: String, Codable {
    case family = "Family"
    case friends = "Friends"
    case work = "Work"
    case other = "Other"
}

enum RSVPStatus: String, Codable {
    case attending, declined, noResponse
}