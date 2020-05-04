import Foundation

struct Photo: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downloadURL = "download_url"
    }

    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: URL
    let downloadURL: URL
}
