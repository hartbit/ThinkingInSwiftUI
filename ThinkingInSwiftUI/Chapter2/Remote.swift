import Foundation
import Combine

class Remote<T>: ObservableObject {
    let url: URL
    var result: T? = nil
    var objectWillChange: Publishers.HandleEvents<ObservableObjectPublisher> {
        objectWillChangePublisher.handleEvents(receiveSubscription: { [unowned self] _ in
            self.load()
        })
    }

    private var objectWillChangePublisher = ObservableObjectPublisher()
    private let transform: (Data) throws -> T

    init(url: URL, transform: @escaping (Data) throws -> T) {
        self.url = url
        self.transform = transform
    }

    private func load() {
        guard result == nil else {
            return
        }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let result = try data.map(self.transform)
                DispatchQueue.main.async {
                    self.objectWillChangePublisher.send()
                    self.result = result
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}
