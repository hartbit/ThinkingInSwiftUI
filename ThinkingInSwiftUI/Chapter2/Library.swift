import UIKit

class Library {
    private var photos: [URL: Remote<UIImage>] = [:]

    static let shared = Library()

    func photo(at url: URL) -> Remote<UIImage> {
        if let photo = photos[url] {
            return photo
        }

        let photo = Remote<UIImage>(url: url) { data in
            if let image = UIImage(data: data) {
                return image
            } else {
                throw ImageLoadingError()
            }
        }

        photos[url] = photo
        return photo
    }
}
