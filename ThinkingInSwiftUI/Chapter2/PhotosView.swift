import SwiftUI

struct PhotosView: View {
    @ObservedObject var remote: Remote<[Photo]>

    var body: some View {
        NavigationView {
            Group {
                if remote.result != nil {
                    List {
                        ForEach(remote.result!) { photo in
                            NavigationLink(destination: PhotoView(photo.remoteImage)) {
                                PhotoCell(photo: photo)
                                    .frame(height: 44)
                            }
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                        }
                    }.onAppear() {
                        UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    }
                } else {
                    ActivityView()
                }
            }.navigationBarTitle("Photos")
        }
    }
}

struct PhotoCell: View {
    let photo: Photo
    @ObservedObject var remoteImage: Remote<UIImage>

    init(photo: Photo) {
        self.photo = photo
        remoteImage = photo.remoteImage
    }

    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.white)
                .overlay(
                    Image(uiImage: remoteImage.result ?? UIImage(named: "image-placeholder")!)
                        .resizable()
                        .scaledToFill()
                )
                .aspectRatio(1, contentMode: .fit)
                .clipped()
            Text(photo.author)
        }
    }
}

extension Photo {
    var remoteImage: Remote<UIImage> {
        Library.shared.photo(at: downloadURL)
    }
}
