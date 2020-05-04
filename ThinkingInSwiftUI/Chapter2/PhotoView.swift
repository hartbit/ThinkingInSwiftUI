import SwiftUI

struct ImageLoadingError: Error {
}

struct PhotoView: View {
    @ObservedObject var photo: Remote<UIImage>

    init(_ photo: Remote<UIImage>) {
        self.photo = photo
    }

    var body: some View {
        Group {
            Image(uiImage: photo.result ?? UIImage(named: "image-placeholder")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .navigationBarTitle("Photo")
    }
}
