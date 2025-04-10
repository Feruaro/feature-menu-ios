import Foundation

struct MenuProfileGroup: Codable {
    var group: [MenuProfile]?
}

struct MenuProfile: Codable {
    var title: String?
    var child: [ItemMenuProfile]?
}

struct ItemMenuProfile: Codable {
    var title: String?
}

